//
//  DiaryModel.swift
//  PersonalDiary-Group3
//
//  Created by Konda,Soumya on 4/19/23.
//

import Foundation
struct DiaryModel {
    var SID = "";
    var id=UUID()
    var title = ""
    var date=""
    var description = ""
    var image = ""
    var emojiMood=""
}
let d1 = DiaryModel(SID: "S556463",title:"Went to restaurants",date:"04/01/2023",description:"Yesterday, I went to a restaurant for lunch with a friend. The restaurant was a small, cozy place with a friendly atmosphere. As we walked in, we were greeted by the hostess and shown to our table.To finish off our meal, we shared a slice of chocolate cake. It was rich and decadent, and the perfect end to our delicious meal",image: "img1")
let d2 = DiaryModel(SID: "S555674",title:"hectic day",date:"04/02/2023",description:"Yesterday was a hectic day for me. I woke up early to prepare for a job interview, which I had to rush to as I was running late. After the interview, I had to quickly make my way to a doctor's appointment, where I waited for over an hour before being seen. Following that, I had a series of errands to run, including grocery shopping and picking up a package from the post office. By the time I got home, I was exhausted and just wanted to relax. Despite the chaos of the day, I managed to accomplish everything on my to-do list and felt a sense of satisfaction knowing that I had been productive.",image: "img2")
let d3 = DiaryModel(SID: "S556463",title:"Fun day at office",date:"04/03/2023",description:"Today was a fun day at the office! We started the day with a team meeting where we discussed our progress on a new project and brainstormed some fresh ideas. During our lunch break, we all went out to a nearby food truck festival and tried some delicious food together. In the afternoon, we had a team-building activity where we played some fun games and had a lot of laughs. We ended the day with a happy hour in the office where we enjoyed some drinks and snacks while chatting and getting to know each other better. It was a great day that left us feeling energized and motivated!",image: "img3")

let d4 =
DiaryModel(SID: "S550099", title: "First Day of Summer Vacation", date: "2023-06-01", description: "Today was the first day of my summer vacation and I spent it at the beach with my family. The weather was perfect and we had a lot of fun building sandcastles and playing in the water.", image: "beach", emojiMood: "🌞")

let d5 =
DiaryModel(SID: "S550099", title: "Hiking in the Mountains", date: "2023-06-05", description: "I went hiking in the mountains with some friends today. It was a challenging trail but the views were absolutely breathtaking.", image: "mountains", emojiMood: "🏞️")

let d6 =
DiaryModel(SID: "S550299", title: "Family Reunion", date: "2023-06-10", description: "I attended a family reunion today and it was great to see so many relatives that I haven't seen in a long time. We had a lot of good food and shared many stories and memories.", image: "family", emojiMood: "👨‍👩‍👧‍👦")

let d7 =
DiaryModel(SID: "S549133", title: "Movie Night with Friends", date: "2023-06-15", description: "I had a movie night with some friends and we watched an action-packed thriller. It was a lot of fun and we had a lot of laughs.", image: "movie", emojiMood: "🍿")


let notesList = [d1,d2,d3,d4,d5,d6,d7]
