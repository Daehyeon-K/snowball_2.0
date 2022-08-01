<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href='/resources/fullcalendar-5.11.0/lib/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-5.11.0/lib/main.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyBJ6ARqJPy-NrJ0QggzxwBnf_Ternk_bLs',
    eventSources: [
    {
          googleCalendarId: 'lk931101@gmail.com',
          className: '프로젝트',
          color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
        }/*,
       {
          googleCalendarId: 'lk931101@gmail.com',
          className: '정보처리기능사',
            color: '#204051',
            //textColor: 'black' 
        },
      {
          googleCalendarId: 'lk931101@gmail.com',
          className: '정보처리기사',
            color: '#3b6978',
            //textColor: 'black' 
        } */
    ]
  });
  calendar.render();
});
</script>
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>
</head>

</head>
<body>

<div id="calendar"></div>

</body>
</html>