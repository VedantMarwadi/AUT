/* Question 2 */
select h.city, count(roomno)
from hotel h, booking b
where b.hotelno = h.hotelno
group by h.city;

/* Question 3 */
select b.guestno, count(roomno)
from hotel h, booking b
where b.hotelno = h.hotelno
group by b.guestno;


/* Question 4 */
select b.guestno, h.city, count(roomno)
from hotel h, booking b
where b.hotelno = h.hotelno
group by b.guestno, h.city;