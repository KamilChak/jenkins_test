from django.test import TestCase
from django.urls import reverse
from .models import Counter

class CounterViewTests(TestCase):

    def setUp(self):
        # Create a Counter object with the key 'counter' if it does not exist
        self.counter = Counter.objects.create(key='counter', value=0)

    def test_counter_initial_value(self):
        """Test that the counter starts at 1 if it's the first request"""
        response = self.client.get(reverse('index'))  # Adjust 'index' to your URL name
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, '1')  # Check if the value 1 is in the rendered page

    def test_counter_increment(self):
        """Test that the counter value increments with each request"""
        # Perform the first request
        self.client.get(reverse('index'))
        self.client.get(reverse('index'))
        response = self.client.get(reverse('index'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, '3')  # Should be 3 after three requests

    def test_counter_created_on_first_request(self):
        """Test that a Counter object is created on the first request"""
        Counter.objects.all().delete()  # Ensure no counters exist
        response = self.client.get(reverse('index'))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(Counter.objects.count(), 1)  # Check if a Counter object was created
        self.assertEqual(Counter.objects.first().value, 1)  # Initial value should be 1
