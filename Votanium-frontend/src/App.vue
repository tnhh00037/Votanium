<template>
  <div id="app">
    <app-header></app-header>
    <router-view/>
    
  </div>
</template>

<script>
import HeaderComponent from '@/components/common/HeaderComponent';
import FooterComponent from '@/components/common/FooterComponent';

export default {
  name: 'App',
  components: {
    'app-header': HeaderComponent,
    'app-footer': FooterComponent,
  }
}
</script>

<style>

</style>
