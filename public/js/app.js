var app = new Vue({
  el: '#dashboardapp',
  data: {
    {
    "name" : "Tapestry",
    "short_description": "Build a visualization layer for the project dashboard",
    "start_date" : "2018-07-01",
    "target_date" : "2018-11-03",
    "budget" : "4950000",
    "spent" : "3456700",
    "projected_spend": "4740500",
    "weekly_effort_target": 400
  }
},
computed: {
  days_left: function(){
    // this .target_date
    return 31;
  }
},
methods:{
  pretty_date: function (d){
    //do magic
    return d;
  }
}
})
