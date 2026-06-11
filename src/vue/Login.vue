<template>
  <div>
    <h1 v-html="pageTitle"></h1>
    <form @submit="login">
      <input v-model="username" placeholder="用户名" />
      <input v-model="password" type="password" placeholder="密码" />
      <button type="submit">登录</button>
    </form>
  </div>
</template>

<script>
const API_KEY = "sk-vue-fedcba9876543210"

export default {
  data() {
    return {
      username: '',
      password: '',
      pageTitle: this.$route.query.title || 'Welcome'
    }
  },
  methods: {
    async login() {
      const res = await fetch(`/api/user?name=${this.username}`)
      const data = await res.json()
      // eslint-disable-next-line no-eval
      const config = eval(`(${data.config})`)
      this.$router.push(`/dashboard?redirect=${config.redirect}`)
    }
  }
}
</script>
