/* global ELEMENT UB Vue */

// if you reload page after login, this variable is true
const wasLogInBeforeReload = localStorage.getItem(location.origin + '/:storedSession') !== null

const REQ_ENTITY = 'pl_product'
const REQ_ATTRS = ['ID', 'name']

// english localisation to element library
ELEMENT.locale(ELEMENT.lang.en)

const Main = {
  data () {
    return {
      form: {
        login: '',
        pass: ''
      },
      logInFormVisible: false,
      failedToLogInDialogVisible: false,
      isLogIn: wasLogInBeforeReload,
      isLoading: false,
      tableData: []
    }
  },
  methods: {
    login: function () {
      this.isLoading = true
      UB.connect({
        host: window.location.origin,
        allowSessionPersistent: true,
        onCredentialRequired: function (conn, isRepeat) {
          if (isRepeat) {
            return Promise.reject(new UB.UBAbortError('invalid password or username'))
          } else {
            return Promise.resolve({ authSchema: 'UB', login: this.form.login, password: this.form.pass })
          }
        }.bind(this),
        onAuthorizationFail: function (reason) {
          this.isLoading = false
          this.failedToLogInDialogVisible = true
          UB.showErrorWindow(reason)
        }.bind(this)
      }).then(function (conn) {
        this.isLoading = false
        this.isLogIn = true
        this.logInFormVisible = false
        window.$conn = conn
        this.getData()
      }.bind(this))
    },
    logout: function () {
      if (window.$conn) {
        window.$conn
          .logout()
          .then(function () {
            this.isLogIn = false
            this.logInFormVisible = true
          }.bind(this))
      }
    },
    getData: function () {
      window.$conn.Repository(REQ_ENTITY).attrs(REQ_ATTRS).select()
        .then(function (data) {
          this.tableData = data
        }.bind(this))
    }
  },
  // this part execute after page load
  mounted: function () {
    // auto login and show requests after reload logged page
    if (wasLogInBeforeReload) {
      UB.connect({
        host: window.location.origin,
        allowSessionPersistent: true,
        onAuthorizationFail: function (reason) {
          UB.showErrorWindow(reason)
        }
      }).then(function (conn) {
        window.$conn = conn
        this.getData()
      }.bind(this))
    }
  }
}
const Ctor = Vue.extend(Main)
new Ctor().$mount('#app')
