"""def greet(name):
    return "Hello, " + name + "!" """

from sklearn.feature_extraction.text import CountVectorizer
from sklearn.svm import LinearSVC

# Define some training data for the chatbot
            string[] greetingInput = { "hello", "hi", "heyyaa", "hey", "hii", "hiii", "hey there", "hello!", "how are you", "hellooo","can you help me" };
            string[] byeInput = { "byeee", "see you", "tata", "bye", "thank you", "goodbye", "bub bye", "byee!", "thanks" };
            string[] menuInput = { "menu", "list", "categories", "category", "can you show me the menu", "please show me the menu", "food items", "provide menu" };
            string[] foodInput = { "burger", "noodles", "pizza", "veg-pizza", "pulav", "french fries", "can you show me the burger","juices", "list of burgers", "send me burger list", "send me pizza list", "send me noodles list", "send me veg pizza list", "send me pulav list", "provide menu", "send me the menu" };
            string[] orderInput = { "order", "add to cart", "cheese-pizza", "cheese-burger", "book","add" };// "tuna", "pepperoni", "margherita", "veg-crispy", "turkey-burger", "the grill thrill" };
            string[] cartInput = { "cart", "show cart", "take me to cart", "i want to see cart items", "items in my cart ", "which items is there in my cart", "no of items in my cart", "total items in my cart", "is my cart empty", "visit to cart" };
            string[] removecart = { "remove", "delete", "clear" };


training_data = [
    {'text': 'I want to order a pizza', 'intent': 'order'},
    {'text': 'Add some items to my cart', 'intent': 'cart'},
    {'text': 'Can you help me with something else?', 'intent': 'none'},
    # Add more training examples as needed
]

# Create a vectorizer to convert text into a bag of words representation
vectorizer = CountVectorizer()

# Extract the text and intent labels from the training data
texts = [item['text'] for item in training_data]
intents = [item['intent'] for item in training_data]

# Convert the text into a bag of words feature matrix
features = vectorizer.fit_transform(texts)

# Train a support vector machine (SVM) classifier on the features and intents
clf = LinearSVC()
clf.fit(features, intents)

# Define a function to predict the intent of user input
def predict_intent(user_input):
    # Extract features from the user input using the same vectorizer as the training data
    features = vectorizer.transform([user_input])

    # Use the trained SVM classifier to predict the intent of the user input
    intent = clf.predict(features)[0]

    # Return the predicted intent
    return intent

# Test the function with some example inputs
#print(predict_intent("I want to order a pizza"))
#print(predict_intent("Add some items to my cart"))
#print(predict_intent("Can you help me with something else?"))

