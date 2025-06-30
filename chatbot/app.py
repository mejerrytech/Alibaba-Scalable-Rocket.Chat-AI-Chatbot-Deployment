import openai
import os
from flask import Flask, request, jsonify

app = Flask(__name__)

# Load OpenAI API key from environment variable
openai.api_key = os.getenv("OPENAI_API_KEY")

@app.route("/message", methods=["POST"])
def handle_message():
    data = request.json

    # Get the text from the incoming Rocket.Chat message
    user_message = data.get("text", "")

    if not user_message:
        return jsonify({"error": "No message provided"}), 400

    try:
        # Send the user message to GPT-3
        response = openai.Completion.create(
            model="text-davinci-003",  # You can use other models here
            prompt=user_message,
            max_tokens=150,
            temperature=0.7
        )

        # Extract GPT-3's response
        bot_reply = response.choices[0].text.strip()

        # Return the response as a message to Rocket.Chat
        return jsonify({
            "text": bot_reply
        })

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5005)

