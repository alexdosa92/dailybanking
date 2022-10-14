##  Foundation  -  Mobile  developer  technical  assessment



###  Introduction


Using the application framework provided for you, **create  a  movie  browsing  application** that displays a list of most popular movies, as well as some basic details about them.



###  Implementation  details


-  Use  the  application  framework  provided  for  you.

-  Write  your  application  using  Swift.

-  Host  your  project  on  GitHub.  Use  git  as  you  see  fit.

-  Use  the  latest  version  of  [TMDB  api](https://developers.themoviedb.org/3/getting-started/introduction)  to  fetch  data  about  movies.  An  API  key  will  be  provided  for  you.

-  Create  a  screen  to  show  a  list  of  trending  movies.  Display  some  additional  info  including  the  movie  poster,  title,  its  genres, rating etc. (UI is provided)

-  Selecting  a  movie  from  the  list,  the  user  should  navigate  to  the  detail  page  of  that  movie,  that  displays  some  additional  info. (UI + navigation provided)

- On the details screen the user can mark the movie and add it to their own list. This list should be persisted locally, so it should be still exists even after the user restarts the app. This status is also visible on the movie list.

-  Please  note  that  TMDB  uses  unique  genre  IDs  that  need  to  be  resolved  using  a  separate  API  call.  Do  not  hardcode  genres  into  your  application.



###  Notes
- You will find the API_KEY in the project.

- To speed you up, we already implemented the UI part of the screens.

-  Think  of  the  screens  you  are  about  to  implement  as  part  of  a  bigger  application.  Choose  your  coding  standards  as  if  you  planned  to  maintain  the  application  for  years.

- When downloading the data, keep in mind that a planned future feature will also want to use and display those somewhere else in the app.

-  The  application  framework  that  is  provided  for  you  uses  an  MVVM  approach.  We  advise  to  separate  your  code  into  layers  that  you  see  fit  in  this  architecture.

-  Review  the  dependencies,  and  try  to  use  these  technologies  in  your  application.  If  you  are  not  familiar  with  some  of  them,  you  can  use  alternatives  you  have  more  experience  with.
- We encourage you to create new files and restructure the project to your own taste.


