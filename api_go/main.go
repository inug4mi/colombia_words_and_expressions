package main

import (
	"database/sql"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

var db *sql.DB

func connectDB() {
	connStr := os.Getenv("DATABASE_URL")

	var err error
	db, err = sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
}

func getWords(c *gin.Context) {
	rows, err := db.Query("SELECT id, term, meaning FROM words")
	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}

	var words []map[string]interface{}

	for rows.Next() {
		var id int
		var term, meaning string
		rows.Scan(&id, &term, &meaning)

		words = append(words, gin.H{
			"id": id,
			"term": term,
			"meaning": meaning,
		})
	}

	c.JSON(200, words)
}

func main() {
	connectDB()

	r := gin.Default()
	r.GET("/words", getWords)

	r.Run()
}