var tasksApp = new Vue({
  el: '#taskMain',
  data: {
    task: {
      id: 0,
      title: 'foo',
      type : '',
      size : '',
      team : '',
      status: '',
      start_date: '',
      close_date: null,
      hours_worked: '',
      perc_complete: '',
      current_sprint : ''
    },
    work: [ ],
    workForm: { },// populated by this.getEmptyWorkForm()
    teamLink: [] //all the teams
  },
  computed: {
    workSpan () {
      return moment(this.workForm.stop + ' ' + this.workForm.stop_time)
             .diff(moment(this.workForm.start + ' ' + this.workForm.start_time), 'hours', true)
             .toFixed(1);
    }
  },
  methods: {
    handleWorkForm(e) {

      // TODO: Check validity in a better way
      if (this.workSpan <= 0) {
        console.error('Cannot submit, invalid values');
        return;
      }

      this.workForm.start_date = this.workForm.start + ' ' + this.workForm.start_time;
      this.workForm.hours = this.workSpan;
      //stop field not used by th API
      //this.workForm.stop_date = this.workForm.stop + ' ' + this.workForm.stop_time;

      const s = JSON.stringify(this.workForm);

      console.log(s);

      // POST to remote server
      fetch('api/work.php',{
      method: 'POST',
      headers: {
        "Content Type": "application.json;charset=utf-8"
      },
      body: s
    })
      .then( response => response.json())
      .then (json => {this.work.push(json)})
      .catch (err => {
        console.error('WORK POST ERROR:');
        console.error(err);
      })

      //TODO: Append result
      // this.work.push(JSON.parse(s));

      // Reset workForm
      this.workForm = this.getEmptyWorkForm();
    },
    sumHours() {
      return this.work.reduce( (sum, current) => sum + current.hours, 0 )
    },
    diffAsHours() {
      return 0 //moment().duration(end.diff(startTime)).asHours();
    },
    getEmptyWorkForm() {
      return {
        start: moment().format('YYYY-MM-DD'),
        start_time: moment().format('HH:mm'),
        stop: moment().format('YYYY-MM-DD'),
        stop_time: moment().format('HH:mm'),
        team_id: null,
        task_id: this.task.id,
        completion_estimate: 0
      }
    },
    prettyDate(d) {
      return moment(d).format('YYYY-MM-DD HH:mm')
    }
  },
  created () {

    // Do data fetch
    const url = new URL(window.location.href);
    const taskId = url.searchParams.get('taskId');
    console.log('Task: '+ taskId);
    this.task.id = taskId;

    if (!taskId) {
      //TODO: Error? 404?
      //e.g., window.location = '404.html';
    }

    // Populate workForm with default values
    this.workForm = this.getEmptyWorkForm();
    // TODO: Fetch task-specific data
    // fetch('api/task?id=4')
    fetch('api/work.php?taskId='+taskId)
    .then( response => response.json())
    .then (json => {tasksApp.work = json;})
    .catch (err => {
      console.error('WORK FETCH ERROR:');
      console.error(err);
    })

    fetch('api/team.php')
    .then( response => response.json())
    .then (json => {tasksApp.teamList = json;})
    .catch (err => {
      console.log('TEAM LIST ERROR:');
      console.log(err);
    })
  }
})
