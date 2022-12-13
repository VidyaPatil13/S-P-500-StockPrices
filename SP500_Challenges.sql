/* ---- CHALLANGES ---- */

/* Which date in the sample saw the largest overall trading volume?
 On that date, which two stocks were traded most? */
 
 select symbol, volume, `date` 
 from SP_500 
 where `date`=(select `date`
               from (select `date`, avg(volume) as average_volume 
					 from sp_500 
                     group by `date` 
					 order by average_volume 
                     desc limit 1) 
                as tmp) 
 order by volume 
 desc limit 2;
 
 
 /* On which day of the week does volume tend to be highest? Lowest? */
 
  -- Highest
  select dayofweek(`date`) as day_number, dayname(`date`) as day_name , avg(volume) as average_volume
  from sp_500 
  group by day_number 
  order by average_volume 
  desc limit 1;
  
  -- Lowest
  select dayofweek(`date`) as day_number, dayname(`date`) as day_name , avg(volume) as average_volume
  from sp_500 
  group by day_number 
  order by average_volume 
  limit 1;
                   
 
/* On which date did Amazon (AMZN) see the most volatility, measured by the difference 
between the high and low price? */

select `date`from (
                    select `date`, (high-low) as volatility 
                    from sp_500 
					where symbol = "AMZN" 
                    order by volatility 
                    desc limit 1) 
as temp;


/* If you could go back in time and invest in one stock from 1/2/2014 - 12/29/2017, which 
would you choose? What % gain would you realize? */

select s1.symbol, (power((s2.`close`/s1.`open` ),(1/4))-1)*100  as Gain_in_Percentage
from 
     (select symbol, `open` 
      from sp_500 
      where `date`= '2014-01-02'
      ) s1
inner join 
      (select symbol, `close` 
       from sp_500 
	   where `date`='2017-12-29') s2
on s1.symbol=s2.symbol
order by Gain_in_Percentage 
desc limit 1;

                   
