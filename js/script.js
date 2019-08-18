load_yaml('data.yml', (data) => {
  data_obj = jsyaml.load(data)
  console.log(data_obj)

  new Vue({
    el: '#nav',
    data: data_obj,
    computed: {
      mailto()    { return `mailto:${this.contact.email}` },
      medium()    { return `https://medium.com/@${this.contact.medium}` },
      github()    { return `https://github.com/${this.contact.github}` },
      linkedin()  { return `https://www.linkedin.com/in/${this.contact.linkedin}/` }
    },
    mounted() {
      this.$nextTick(() => {
        console.log('mounted!')
        document.getElementById("app").style.visibility = "visible"
      })
    }
  })

  const sections = [
    '#whoami',
    '#education',
    '#work',
    '#projects-experience'
  ]
  sections.forEach((section) => 
    new Vue({
      el: section,
      data: data_obj
    })
  )
})


