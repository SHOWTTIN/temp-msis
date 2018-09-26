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
    work: [
      // {
      //   id: 0,
      //   start: '',
      //   stop: '',
      //   hours: '',
      //   completion_estimate: ''
      // }
      {
        "id": 101,
        "start": "2018-07-29T08:30",
        "stop": "2018-07-29T11:30",
        "hours": 3,
        "completion_estimate": 0.10
      },
      {
        "id": 102,
        "start": "2018-07-29T13:30",
        "stop": "2018-07-29T16:30",
        "hours": 3,
        "completion_estimate": 0.25
      },
      {
        "id": 103,
        "start": "2018-07-30T08:30",
        "stop": "2018-07-30T11:30",
        "hours": 3,
        "completion_estimate": 0.5
      },
      {
        "id": 104,
        "start": "2018-08-01T09:30",
        "stop": "2018-08-01T13:30",
        "hours": 4,
        "completion_estimate": 0.8
      },
      {
        "id": 105,
        "start": "2018-08-03T14:30",
        "stop": "2018-08-03T18:30",
        "hours": 4,
        "completion_estimate": 0.85
      }
    ],
    workForm: { }   // populated by this.getEmptyWorkForm()
  },
  computed: {
    workSpan () {
      return moment(this.workForm.stop)
             .diff(moment(this.workForm.start), 'hours', true)
             .toFixed(1);
    }
  },
  methods: {
    handleWorkForm(e) {
      e.preventDefault();

      // TODO: Check validity


      console.log(e);

      // TODO: Calculate hours
      // something like:  moment.duration(end.diff(startTime)).asHours();

      //TODO: clone workForm
      const s = JSON.stringify(this.workForm);
      //TODO: POST to remote server
      // fetch(url,)
      // .then()

      //TODO: Append result
      this.work.push(JSON.parse(s));

      // Reset workForm
      this.workForm = this.getEmptyWorkForm();
    },
    sumHours() {
      return this.work.reduce( (sum, current) => sum + current.hours, 0 )
    },
    diffAsHours() {
      return 0 //moment().duration(end.diff(startTime)).asHours();
    },
    datetimeFormat(d) {
      d = d || moment();
      return moment(d).format('YYYY-MM-DD[T]HH:MM');
    },
    getEmptyWorkForm() {
      return {
        start: this.datetimeFormat(),
        stop: this.datetimeFormat(),
        completion_estimate: 0
      }
    },
    prettyDate(d) {
      return moment(d).format('YYYY-MM-DD HH:MM')
    }
  },
  created () {
    // Populate workForm with default values
    this.workForm = this.getEmptyWorkForm();

    // Do data fetch
    console.log(window.location.href);

    const url = new URL(window.location.href);
    const taskId = url.searchParams.get('taskId');

    console.log('Task: '+ taskId);

    if (!taskId) {
      //TODO: Error? 404?
      //e.g., window.location = '404.html';
    }

    // TODO: Fetch task-specific data
    // fetch('api/task?id=4')
  }
})
