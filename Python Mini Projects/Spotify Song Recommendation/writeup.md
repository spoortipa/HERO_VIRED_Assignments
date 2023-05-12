                                              Python Mini Project - Jupyter Notebook

    **Python Mini Project.ipynb**
    
Spotify makes new songs recommendations to users every week based on the songs that are currently saved in theirplaylists.
Using the below dictionary which is a collection of playlists mantained by 'other' sample users, recommend songs to a new user.

Use the below points as guidelines:

Pass in a list the songs currently listed by a new user. This can have entries like SONGID01,SONGID02,...

Find a playlist in the dictionary, where ALL of these songs are present (there can be more than 1 such playlist)

From this playlist(s), pick the remaining songs and recommend to the new user (refer below examples for more details)

This code generates the existing playlist for you.

Use this playlist to create your solution

In
[42]:
** Don't edit this cell, this create your playlist**

import random,string

songids = ['SONGID'+str(i).zfill(2)for i in range(1,21)]

userid = [''.join('USER')+str(random.randint(10,99)).zfill(2)for i in range(100)]

playlist = {i : j for i,j in zip(userid,[random.sample(songids,random.randint(4,7))for i in range(len(userid))])}

playlist

Out[42]:

{'USER90': ['SONGID03', 'SONGID16', 'SONGID10', 'SONGID01', 'SONGID06'],'USER86': ['SONGID01', 'SONGID14', 'SONGID20', 'SONGID07', 'SONGID06', 'SONGID18'],'USER11': ['SONGID03', 'SONGID05', 'SONGID13', 'SONGID12', 'SONGID10', 'SONGID19'],'USER58': ['SONGID11', 'SONGID14', 'SONGID15', 'SONGID09','SONGID19',

Let's say the new user has listened to these 3 songs

myplist = ['SONGID01','SONGID06','SONGID16']

What songs would you recommend him.

**Answer**

Write your answer here
