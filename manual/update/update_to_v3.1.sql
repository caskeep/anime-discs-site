alter table disc add column type int(11) not null;
alter table anime drop foreign key FK_27ie4kcbo6naglih7y8ug1hkx;
alter table anime drop index UK_27ie4kcbo6naglih7y8ug1hkx;
update disc set type=1 where dvdver=false and boxver=false;
update disc set type=2 where dvdver=true and boxver=false;
update disc set type=3 where dvdver=false and boxver=true;
update disc set type=4 where dvdver=true and boxver=true;
update disc set type=0 where cdver=true;
alter table disc drop column dvdver;
alter table disc drop column boxver;
alter table disc drop column cdver;
