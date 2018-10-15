<template>
    <section class="container">
        <div v-if="eventsAvailable">
            <div v-for="event in events">
                <event-listing :event="event"></event-listing>
            </div>
        </div>
        <div v-else>
            <span>No events available, please try again later.</span>
        </div>
    </section>
</template>

<script>
    import axios from 'axios';
    import EventListing from '~/components/EventListing';

    export default {
        data() {
            return {
                events: [],
            };
        },
        computed: {
            eventsAvailable: function() {
                return this.events.length > 0;
            },
        },
        asyncData ({ params }) {

            //Ensure get request goes to an endpoint that returns an array or json object
            //If a regular HTML page is returned, the v-for in the view above will try to
            //render each character in the HTML page string as a separate event and nuxt
            //will run out of memory

            /*return axios.get('http://localhost/')
                .then((res) => {
                    return { events: res.data }
                })*/

            //Hardcoded test data until JSON api is available
            return {
                events: [
                    {
                        id: '123',
                        title: 'test',
                        start_date: 'test',
                        description: 'test',
                    },
                    {
                        id: '124',
                        title: 'test2',
                        start_date: 'test2',
                        description: 'test2',
                    },
                ],
            };
        },
        components: {
            EventListing,
        },
    };
</script>
