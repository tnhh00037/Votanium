<template>
  <div id="app">
    <app-header></app-header>
    <router-view/>
    <app-footer></app-footer>
  </div>
</template>

<script>
import HeaderComponent from '@/components/common/HeaderComponent';
export default {
  name: 'App',
  components: {
    'app-header': HeaderComponent,
  }
}
</script>

<style>

</style>
