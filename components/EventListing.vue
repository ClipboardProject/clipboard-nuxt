<template>
	<div class="list-group">
		<a :href="eventUrl" class="list-group-item">
			<h4 class="list-group-item-heading">{{ event.title }}</h4>
			<b><p class="list-group-item-text">{{ event.start_date }}</p></b><br>
			<p class="list-group-item-text">{{ event.description }}</p>
		</a>
	</div>
</template>

<script>
	export default{
		props: ['event'],
		computed: {
			eventUrl: function(){
				return '/events/' + this.event.id;
			}
		}
	};
</script>