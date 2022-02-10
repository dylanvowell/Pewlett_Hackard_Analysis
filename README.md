# Overview
The purpose of this analysis is to prepare the company, Pewlett Hackard, for the inevitable wave of employees leaving the workforce due to retirement. This would have resounding impacts on the company without proper planning, so creating this report is the first step in the process of transitioning the retirees out in a way that would benefit the company instead of hurt it. 

## Results
Upon running reports in SQL, we were able to identify a few major points:
  
  - There are an extremely large amount of employees coming up on their retirement, (over 50,000), as seen below:
  
  ![Retireing Employees](https://github.com/dylanvowell/Pewlett_Hackard_Analysis/blob/main/Data/Retiring_by_dept.png?raw=true)
  
  - Unfortunately, the majority of folks retiring are in senior roles - which removes a lot of experience from the bulk of the company. 

  - There needs to be a transition period between when folks completely retire out of the company and when the younger staff moves up to take their place. 

  - A mentorship program would be well-suited for this transition and would allow the company to retain some of it's experienced workers on a part-time basis until all of the non-retiring employees who are eligible for mentorship are trained. The number of employees eligible for the mentorship program are below:
  
  ![Mentorship](https://github.com/dylanvowell/Pewlett_Hackard_Analysis/blob/main/Data/ME_titles%20SS.png?raw=true)
  
##Summary
Over 50,000 roles will need to be filled before the last person from this "silver tsunami" retires. Over the course of the three years that we used in our queries (1952-1955), this means that we will need to hire in and mentore 10,000 employees a year total. We can see how many people per department need to be mentored over those three years by the following code: 

``SELECT COUNT(me.title), me.title 
FROM mentorship_eligibility as me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC;``

This gives you the number of folks eligible for mentorship per department, as seen in my second screenshot above. PH would need to hire the total amount of retiring employees minus the ones eligible for mentorship over three years. 

We can create a query to see what the first wave of retirements would look like per department, and then use that info to assign mentors immediately: 

``SELECT COUNT(rt.title), rt.title 
FROM retirement_titles_1952 as rt
GROUP BY rt.title
ORDER BY COUNT(rt.title) DESC;``

This query shows that 6.9k and 6.6k Senior Engineers and Senior Staff are retiring this year, respectively. Using this, we can assign those mentors to the folks eligible for mentorship in Deliverable 2. Every year, we would need to re-run both queries with updated dates in order to determine how many new mentors and mentees will be added to the program.
