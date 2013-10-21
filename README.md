American Indians vs Indian Americans, statewide population using googleVis
========================================================

The population of Native Americans in the United States is estimated to be anywhere upto [20 million] (http://en.wikipedia.org/wiki/Native_Americans_in_the_United_States). I wanted to find out what the population of Native Americans (originally referred to as American Indians by immigrants) is and compare it to the number of Indians from India (Indian Americans).

I wanted to do this comparison by county, but the US Census Bureau and other Federal websites are unavailable because of the Government shutdown (as of Oct 7 2013). Hence I obtained state-wide totals of American Indians and Indian Americans from several sources and made the below maps using R and googleVis.

**Data** - 
* State-wide population of American Indians in 2010 - [wikipedia](http://en.wikipedia.org/wiki/Native_Americans_in_the_United_States)
* State-wide population totals of US states in 2010 - [wikipedia](http://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population)
* State-wide population totals of Indian Americans in 2010 - [news article](http://www.indiawest.com/news/3783-analysis-of-the-indian-american-community-from-census-2010-data.html)

First, I copied the data into a spreadsheet and cleaned it up and saved into a text file called "pop_indians.txt".


```r
# read data
pop_data <- read.delim("pop_indians.txt", as.is = TRUE)

head(pop_data)
```

```
##        State Pop_IndAm Pop_AmInd  Tot_Pop
## 1     Alaska      1218    104871   710231
## 2    Alabama     13036     28218  4779736
## 3   Arkansas      7973     22248  2915918
## 4    Arizona     36047    296529  6392017
## 5 California    528176    362801 37253956
## 6   Colorado     20369     56010  5029196
```


Next, I estimated the number of Indian Americans and American Indians as number per 1000 of the total population of each state.


```r
# calculate number per 1000 of total population
pop_data$Indian_American <- sprintf("%.1f", pop_data$Pop_IndAm * 1000/pop_data$Tot_Pop)
pop_data$American_Indian <- sprintf("%.1f", pop_data$Pop_AmInd * 1000/pop_data$Tot_Pop)

head(pop_data)
```

```
##        State Pop_IndAm Pop_AmInd  Tot_Pop Indian_American American_Indian
## 1     Alaska      1218    104871   710231             1.7           147.7
## 2    Alabama     13036     28218  4779736             2.7             5.9
## 3   Arkansas      7973     22248  2915918             2.7             7.6
## 4    Arizona     36047    296529  6392017             5.6            46.4
## 5 California    528176    362801 37253956            14.2             9.7
## 6   Colorado     20369     56010  5029196             4.1            11.1
```


Next, make some maps using googleVis.


```r
# load libraries
library(knitr)
suppressPackageStartupMessages(library(googleVis))
```


American Indians, per 1000 people
-----------------


```r
# plot american indians
chart_1 <- gvisGeoChart(data = pop_data, locationvar = "State", colorvar = "American_Indian", 
    options = list(region = "US", displayMode = "regions", resolution = "provinces", 
        colorAxis = "{minValue: 0, maxValue: 150, colors:['grey', 'black', 'green', 'blue', 'violet']}", 
        width = 600, height = 400), chartid = "AmInd")

plot(chart_1, "chart")
```

<!-- GeoChart generated in R 3.0.2 by googleVis 0.4.5 package -->
<!-- Mon Oct 07 11:59:33 2013 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataAmInd () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Alaska",
147.7 
],
[
 "Alabama",
5.9 
],
[
 "Arkansas",
7.6 
],
[
 "Arizona",
46.4 
],
[
 "California",
9.7 
],
[
 "Colorado",
11.1 
],
[
 "Connecticut",
3.1 
],
[
 "District of Columbia",
3.5 
],
[
 "Delaware",
4.7 
],
[
 "Florida",
3.8 
],
[
 "Georgia",
3.3 
],
[
 "Hawaii",
3.1 
],
[
 "Iowa",
3.6 
],
[
 "Idaho",
13.7 
],
[
 "Illinois",
3.4 
],
[
 "Indiana",
2.8 
],
[
 "Kansas",
9.9 
],
[
 "Kentucky",
2.3 
],
[
 "Louisiana",
6.7 
],
[
 "Massachusetts",
2.9 
],
[
 "Maryland",
3.5 
],
[
 "Maine",
6.5 
],
[
 "Michigan",
6.3 
],
[
 "Minnesota",
11.5 
],
[
 "Missouri",
4.6 
],
[
 "Mississippi",
5.1 
],
[
 "Montana",
63.2 
],
[
 "North Carolina",
12.8 
],
[
 "North Dakota",
54.4 
],
[
 "Nebraska",
10.1 
],
[
 "New Hampshire",
2.4 
],
[
 "New Jersey",
3.3 
],
[
 "New Mexico",
93.8 
],
[
 "Nevada",
11.9 
],
[
 "New York",
5.5 
],
[
 "Ohio",
2.2 
],
[
 "Oklahoma",
85.8 
],
[
 "Oregon",
13.9 
],
[
 "Pennsylvania",
2.1 
],
[
 "Rhode Island",
5.8 
],
[
 "South Carolina",
4.2 
],
[
 "South Dakota",
88.2 
],
[
 "Tennessee",
3.2 
],
[
 "Texas",
6.8 
],
[
 "Utah",
11.9 
],
[
 "Virginia",
3.7 
],
[
 "Vermont",
3.5 
],
[
 "Washington",
15.4 
],
[
 "Wisconsin",
9.6 
],
[
 "West Virginia",
2 
],
[
 "Wyoming",
23.7 
] 
];
data.addColumn('string','State');
data.addColumn('number','American_Indian');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartAmInd() {
var data = gvisDataAmInd();
var options = {};
options["width"] =    600;
options["height"] =    400;
options["region"] = "US";
options["displayMode"] = "regions";
options["resolution"] = "provinces";
options["colorAxis"] = {minValue: 0, maxValue: 150, colors:['grey', 'black', 'green', 'blue', 'violet']};

    var chart = new google.visualization.GeoChart(
    document.getElementById('AmInd')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartAmInd);
})();
function displayChartAmInd() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartAmInd"></script>
 
<!-- divChart -->
  
<div id="AmInd"
  style="width: 600px; height: 400px;">
</div>


Indian Americans, per 1000 people
-----------------

```r
# plot indian americans
chart_2 <- gvisGeoChart(data = pop_data, locationvar = "State", colorvar = "Indian_American", 
    options = list(region = "US", displayMode = "regions", resolution = "provinces", 
        colorAxis = "{minValue: 0, maxValue: 150, colors:['grey', 'black', 'green', 'blue', 'violet']}", 
        width = 600, height = 400), chartid = "IndAm")

plot(chart_2, "chart")
```

<!-- GeoChart generated in R 3.0.2 by googleVis 0.4.5 package -->
<!-- Mon Oct 07 11:59:33 2013 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataIndAm () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Alaska",
1.7 
],
[
 "Alabama",
2.7 
],
[
 "Arkansas",
2.7 
],
[
 "Arizona",
5.6 
],
[
 "California",
14.2 
],
[
 "Colorado",
4.1 
],
[
 "Connecticut",
13 
],
[
 "District of Columbia",
8.7 
],
[
 "Delaware",
12.7 
],
[
 "Florida",
6.8 
],
[
 "Georgia",
9.9 
],
[
 "Hawaii",
1.6 
],
[
 "Iowa",
3.6 
],
[
 "Idaho",
1.4 
],
[
 "Illinois",
14.7 
],
[
 "Indiana",
4.3 
],
[
 "Kansas",
4.9 
],
[
 "Kentucky",
2.9 
],
[
 "Louisiana",
2.5 
],
[
 "Massachusetts",
11.8 
],
[
 "Maryland",
13.7 
],
[
 "Maine",
1.5 
],
[
 "Michigan",
7.8 
],
[
 "Minnesota",
6.2 
],
[
 "Missouri",
3.9 
],
[
 "Mississippi",
1.9 
],
[
 "Montana",
0.6 
],
[
 "North Carolina",
6 
],
[
 "North Dakota",
2.3 
],
[
 "Nebraska",
3.2 
],
[
 "New Hampshire",
6.3 
],
[
 "New Jersey",
33.2 
],
[
 "New Mexico",
2.2 
],
[
 "Nevada",
4.3 
],
[
 "New York",
16.2 
],
[
 "Ohio",
5.6 
],
[
 "Oklahoma",
3.2 
],
[
 "Oregon",
4.4 
],
[
 "Pennsylvania",
8.1 
],
[
 "Rhode Island",
4.4 
],
[
 "South Carolina",
3.4 
],
[
 "South Dakota",
1.4 
],
[
 "Tennessee",
3.8 
],
[
 "Texas",
9.8 
],
[
 "Utah",
2.2 
],
[
 "Virginia",
13 
],
[
 "Vermont",
2.2 
],
[
 "Washington",
9.1 
],
[
 "Wisconsin",
4 
],
[
 "West Virginia",
1.8 
],
[
 "Wyoming",
1 
] 
];
data.addColumn('string','State');
data.addColumn('number','Indian_American');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartIndAm() {
var data = gvisDataIndAm();
var options = {};
options["width"] =    600;
options["height"] =    400;
options["region"] = "US";
options["displayMode"] = "regions";
options["resolution"] = "provinces";
options["colorAxis"] = {minValue: 0, maxValue: 150, colors:['grey', 'black', 'green', 'blue', 'violet']};

    var chart = new google.visualization.GeoChart(
    document.getElementById('IndAm')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartIndAm);
})();
function displayChartIndAm() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartIndAm"></script>
 
<!-- divChart -->
  
<div id="IndAm"
  style="width: 600px; height: 400px;">
</div>



In states with big cities, the number of Indian Americans are more than the American Indians. Moreover, I am not sure whether the statewide totals include or exclude the Indian immigrants who are not citizens of the United States. Also, the spatial patterns at the county resolution are likely going to be different. Only when the Census Bureau websites are back online I can dig into this a little deeper.

Here is the data in a tabluar format.


```r
chart_3 <- gvisTable(data = pop_data)

print(chart_3, "chart")
```

<!-- Table generated in R 3.0.2 by googleVis 0.4.5 package -->
<!-- Mon Oct 07 11:59:33 2013 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTableIDe887873763b () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Alaska",
1218,
104871,
710231,
"1.7",
"147.7" 
],
[
 "Alabama",
13036,
28218,
4779736,
"2.7",
"5.9" 
],
[
 "Arkansas",
7973,
22248,
2915918,
"2.7",
"7.6" 
],
[
 "Arizona",
36047,
296529,
6392017,
"5.6",
"46.4" 
],
[
 "California",
528176,
362801,
37253956,
"14.2",
"9.7" 
],
[
 "Colorado",
20369,
56010,
5029196,
"4.1",
"11.1" 
],
[
 "Connecticut",
46415,
11256,
3574097,
"13.0",
"3.1" 
],
[
 "District of Columbia",
5214,
2079,
601723,
"8.7",
"3.5" 
],
[
 "Delaware",
11424,
4181,
897934,
"12.7",
"4.7" 
],
[
 "Florida",
128735,
71458,
18801310,
"6.8",
"3.8" 
],
[
 "Georgia",
96116,
32151,
9687653,
"9.9",
"3.3" 
],
[
 "Hawaii",
2201,
4164,
1360301,
"1.6",
"3.1" 
],
[
 "Iowa",
11081,
11084,
3046355,
"3.6",
"3.6" 
],
[
 "Idaho",
2152,
21441,
1567582,
"1.4",
"13.7" 
],
[
 "Illinois",
188328,
43963,
12830632,
"14.7",
"3.4" 
],
[
 "Indiana",
27598,
18462,
6483802,
"4.3",
"2.8" 
],
[
 "Kansas",
13848,
28150,
2853118,
"4.9",
"9.9" 
],
[
 "Kentucky",
12501,
10120,
4339367,
"2.9",
"2.3" 
],
[
 "Louisiana",
11174,
30579,
4533372,
"2.5",
"6.7" 
],
[
 "Massachusetts",
77177,
18850,
6547629,
"11.8",
"2.9" 
],
[
 "Maryland",
79051,
20420,
5773552,
"13.7",
"3.5" 
],
[
 "Maine",
1959,
8568,
1328361,
"1.5",
"6.5" 
],
[
 "Michigan",
77132,
62007,
9883640,
"7.8",
"6.3" 
],
[
 "Minnesota",
33031,
60916,
5303925,
"6.2",
"11.5" 
],
[
 "Missouri",
23223,
27376,
5988927,
"3.9",
"4.6" 
],
[
 "Mississippi",
5494,
15030,
2967297,
"1.9",
"5.1" 
],
[
 "Montana",
618,
62555,
989415,
"0.6",
"63.2" 
],
[
 "North Carolina",
57400,
122110,
9535483,
"6.0",
"12.8" 
],
[
 "North Dakota",
1543,
36591,
672591,
"2.3",
"54.4" 
],
[
 "Nebraska",
5903,
18427,
1826341,
"3.2",
"10.1" 
],
[
 "New Hampshire",
8268,
3150,
1316470,
"6.3",
"2.4" 
],
[
 "New Jersey",
292256,
29026,
8791894,
"33.2",
"3.3" 
],
[
 "New Mexico",
4550,
193222,
2059179,
"2.2",
"93.8" 
],
[
 "Nevada",
11671,
32062,
2700551,
"4.3",
"11.9" 
],
[
 "New York",
313620,
106906,
19378102,
"16.2",
"5.5" 
],
[
 "Ohio",
64187,
25292,
11536504,
"5.6",
"2.2" 
],
[
 "Oklahoma",
11906,
321687,
3751351,
"3.2",
"85.8" 
],
[
 "Oregon",
16740,
53203,
3831074,
"4.4",
"13.9" 
],
[
 "Pennsylvania",
103026,
26843,
12702379,
"8.1",
"2.1" 
],
[
 "Rhode Island",
4653,
6058,
1052567,
"4.4",
"5.8" 
],
[
 "South Carolina",
15941,
19524,
4625364,
"3.4",
"4.2" 
],
[
 "South Dakota",
1152,
71817,
814180,
"1.4",
"88.2" 
],
[
 "Tennessee",
23900,
19994,
6346105,
"3.8",
"3.2" 
],
[
 "Texas",
245981,
170972,
25145561,
"9.8",
"6.8" 
],
[
 "Utah",
6212,
32927,
2763885,
"2.2",
"11.9" 
],
[
 "Virginia",
103916,
29225,
8001024,
"13.0",
"3.7" 
],
[
 "Vermont",
1359,
2207,
625741,
"2.2",
"3.5" 
],
[
 "Washington",
61124,
103869,
6724540,
"9.1",
"15.4" 
],
[
 "Wisconsin",
22899,
54526,
5686986,
"4.0",
"9.6" 
],
[
 "West Virginia",
3304,
3787,
1852994,
"1.8",
"2.0" 
],
[
 "Wyoming",
589,
13336,
563626,
"1.0",
"23.7" 
] 
];
data.addColumn('string','State');
data.addColumn('number','Pop_IndAm');
data.addColumn('number','Pop_AmInd');
data.addColumn('number','Tot_Pop');
data.addColumn('string','Indian_American');
data.addColumn('string','American_Indian');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartTableIDe887873763b() {
var data = gvisDataTableIDe887873763b();
var options = {};
options["allowHtml"] = true;

    var chart = new google.visualization.Table(
    document.getElementById('TableIDe887873763b')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "table";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartTableIDe887873763b);
})();
function displayChartTableIDe887873763b() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableIDe887873763b"></script>
 
<!-- divChart -->
  
<div id="TableIDe887873763b"
  style="width: 600px; height: 500px;">
</div>



All relevant files are on my [GitHub site](https://github.com/RationShop/indians)
