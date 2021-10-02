package main

import (
	"log"
	"net/http"
	"strconv"
	"strings"

	"github.com/PuerkitoBio/goquery"
	"github.com/go-telegram-bot-api/telegram-bot-api"
)

const (
	TG_TOKEN = "TOCKEN_FROM_BOT_FATHER"
	GIT_TREE = "https://github.com/Avchar/anderson_devops/tree/master/task_XX"
	GIT_REPO = "https://github.com/Avchar/anderson_devops.git"
	FIND_TASKS = "tus-ok"
)

func createURL(num int) string {
	str := GIT_TREE
	lenStr := len(str)
	char := ""
	s := []byte(str)
	if num < 100 && num >= 0 {
		char = strconv.Itoa(num / 10)
		s[lenStr - 2] = char[0]
		char = strconv.Itoa(num % 10)
		s[lenStr - 1] = char[0]
	} else {
		return "Error"
	}
	return string(s)
}

func checkTask(str string) bool{
	str = str + "/README.md"
	res, err := http.Get(str)
	if err != nil {
		log.Fatal(err)
		return false
	}
	defer res.Body.Close()
	doc, err := goquery.NewDocumentFromReader(res.Body)
	if err != nil {
		log.Fatal(err)
		return false
	}
	resText, _ := doc.Find("h3").Html()
	return strings.Contains(resText, FIND_TASKS)
}

func completedTask() string {
	result := "Completed tasks:\n"
	URL := ""
	iterator := 1
	for {
		URL = createURL(iterator)
		if URL != "Error" {
			res, err := http.Get(URL)
			if err != nil {
				return "Error"
			}
			if res.StatusCode == 404 {
				break
			}
			defer res.Body.Close()
			if res.StatusCode != 200 {
				return "Error"
			} else {
				if checkTask(URL) == true {
					result = result + URL[len(URL) - 7:] + "\n"
				}
			}
		}
		iterator++
	}
	return result
}

func main() {
	bot, err := tgbotapi.NewBotAPI(TG_TOKEN)
	if err != nil {
		log.Panic(err)
	}

	bot.Debug = true

	log.Printf("Authorized on account %s", bot.Self.UserName)

	u := tgbotapi.NewUpdate(0)
	u.Timeout = 60

	updates, err := bot.GetUpdatesChan(u)
	helpText := "This bot support next cmd:\ngit\ntasks\ntask#, where # is the task number\nreset - update cmd tasks\n"
	compTasks := completedTask()

	for update := range updates {
		if update.Message == nil {
			continue
		}

		cmd := strings.Split(update.Message.Text, " ")
		lenCMD := len(cmd)
		rez := ""
		if cmd[0] == "git" && lenCMD == 1 {
			rez = GIT_REPO
		} else if cmd[0] == "tasks" && lenCMD == 1 {
			rez = compTasks
		} else if cmd[0] == "reset" && lenCMD == 1{
			compTasks = completedTask()
			rez = "Done"
		} else if cmd[0] == "help" && lenCMD == 1{
			rez = helpText
		} else if strings.Contains(cmd[0], "task") {
			num, _ := strconv.Atoi(cmd[0][4:])
			if num >= 1 && num < 100 {
				rez = createURL(num)
				res, err := http.Get(rez)
				if err != nil || res.StatusCode != 200{
					rez = "Error"
				}
			} else {
				rez = "Error"
			}
		} else {
			rez = "Error"
		}
		msg := tgbotapi.NewMessage(update.Message.Chat.ID, rez)

		bot.Send(msg)
	}
}
