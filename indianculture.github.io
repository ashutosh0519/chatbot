// html code:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indian Culture Chatbot</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="chatbot-container">
        <div class="chatbot-header">
            <img src="bot.png" alt="Chatbot Icon" class="header-icon">
            <h2 id="heading">INDIAN CULTURE CHATBOT</h2>
        </div>
        <div class="chatbot-body" id="chatbot-body">
            <div class="bot-message">Hello! I am your Indian Culture guide. Ask me anything!</div>
        </div>
        <div class="chatbot-footer">
            
            <input type="text" id="user-input" placeholder="Type your question here..." />
            
            
            <button onclick="startVoiceRecognition()" class="voice-button">    <!-- voice button-->
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                    <path fill="white" d="M12 15a3 3 0 003-3V6a3 3 0 10-6 0v6a3 3 0 003 3zm6-3a6.002 6.002 0 01-5 5.917V21a1 1 0 11-2 0v-3.083A6.002 6.002 0 016 12a1 1 0 112 0 4 4 0 108 0 1 1 0 112 0z" />
                </svg>
            </button>


            <button onclick="sendMessage()" class="send-button">     <!-- send button -->
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                    <path fill="white" d="M1.5 12L23 1.5 16.5 24l-5.25-7.5L1.5 12zm6.75-1.5l4.5 4.5-2.25 6.75L21 4.5 8.25 10.5z"/>
                </svg>
            </button>
        </div>
    </div>

    <script src="cript.js"></script>
</body>
</html>






// css code:
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #e0f7fa;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}


#heading{
    font-size: medium;
    font-weight:normal;

}
.chatbot-container {
    width: 300px; 
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    overflow: hidden;
    margin-right: 30px;
    
}
.chatbot-header {
    background: linear-gradient(135deg, #007bff, #00bcd4);
    color: #ffffff;
    padding: 10px;
    text-align: center;
    font-size: 18px;
    font: weight 100px;;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    display: flex;
    align-items: center;
    justify-content: center; 
    gap: 5px; 
}
.header-icon {
    width: 50px;
    height: 60px; 
    border-radius: 50%;
}

.chatbot-body {
    padding: 15px;
    height: 400px;
    overflow-y: auto;
    background-color: #f4f6f9;
    display: flex;
    flex-direction: column;
    gap: 10px;
}
.chatbot-footer {
    display: flex;
    padding: 10px;
    background-color: #ffffff;
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
    box-shadow: 0px -2px 10px rgba(0, 0, 0, 0.05);
}

.chatbot-footer input[type="text"] {
    flex: 1;
    padding: 10px;
    border: 1px solid #dddddd;
    border-radius: 20px;
    margin-right: 10px;
    outline: none;
    font-size: 14px;
    transition: all 0.3s ease;
}

.chatbot-footer input[type="text"]:focus {
    border-color: #007bff;
}

.chatbot-footer button {
    padding: 0;
    border: none;
    border-radius: 50%;
    background-color: #d38525;
    width: 40px;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    transition: all 0.3s ease;

}

.chatbot-footer button:hover {
    background-color: #b86420;
}
.chatbot-footer button svg {
    fill: white;
    width: 24px;
    height: 24px;
}
.chat-message {
    padding: 10px 15px;
    border-radius: 30px;
    margin-bottom: 10px;
    max-width: 75%;
    display: flex;
    align-items: center;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}

.bot-message {
    background-color: #007bff;
    color: #ffffff;
    align-self: flex-start;
    border-radius: 10px;
}

.user-message {
    background-color: #e0f7fa;
    color: #333333;
    align-self: flex-end;
}


.bot-suggestions {
    display: flex;
    flex-wrap: wrap;
    margin-top: 10px;
    gap: 10px;
}

.suggestion-button {
    background-color: #ffffff;
    border: 1px solid #007bff;
    padding: 8px 15px;
    border-radius: 20px;
    cursor: pointer;
    font-size: 12px;
    color: #007bff;
    transition: all 0.3s ease;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.suggestion-button:hover {
    background-color: #007bff;
    color: #ffffff;
}


.chatbot-footer .voice-button {
    padding: 0;
    border: none;
    border-radius: 50%;
    background-color: #25D366; 
    width: 40px;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    margin-right: 10px; 
    transition: all 0.3s ease;
}

.chatbot-footer .voice-button:hover {
    background-color: #20b858; 
}

.chatbot-footer .voice-button svg {
    fill: white;
    width: 24px;
    height: 24px;
}




//javascript code:

function sendMessage() {
    const userInput = document.getElementById('user-input').value.trim();
    if (userInput) {
        appendUserMessage(userInput);
        generateBotResponse(userInput);
        document.getElementById('user-input').value = '';
    }
}

function startVoiceRecognition() {
    if ('webkitSpeechRecognition' in window) {
        const recognition = new webkitSpeechRecognition();
        recognition.lang = 'en-US';
        recognition.interimResults = false;
        recognition.maxAlternatives = 1;

        recognition.start();

        recognition.onresult = function(event) {
            const userVoiceInput = event.results[0][0].transcript;
            document.getElementById('user-input').value = userVoiceInput;
            sendMessage(); // Automatically send the recognized text
        };

        recognition.onerror = function(event) {
            console.error('Speech recognition error', event.error);
        };

        recognition.onspeechend = function() {
            recognition.stop();
        };
    } else {
        alert('Your browser does not support speech recognition. Please use a different browser.');
    }
}

function appendUserMessage(message) {
    const chatBody = document.querySelector('.chatbot-body');
    const userMessage = document.createElement('div');
    console.log(userMessage);
    console.log(chatBody);
    userMessage.className = 'chat-message user-message';
    userMessage.textContent = message;
    chatBody.appendChild(userMessage);
    scrollToBottom();
}

function generateBotResponse(userInput) {
    let botMessageText = '';
    const normalizedInput = userInput.toLowerCase().trim();

    const responses = {
        'tell me about diwali': 'Diwali, also known as the Festival of Lights, is one of the most popular Hindu festivals celebrated with great enthusiasm in India.',
        'holi': 'Holi is a vibrant festival of colors celebrated in India, marking the arrival of spring and the victory of good over evil.',
        'independence day': 'Independence Day in India is celebrated on August 15th each year, marking the end of British rule in 1947.',
        'yoga': 'Yoga is an ancient practice from India that promotes physical, mental, and spiritual well-being.',
        'taj mahal': 'The Taj Mahal is an iconic white marble mausoleum in Agra, India, built by Mughal Emperor Shah Jahan in memory of his wife Mumtaz Mahal.',
        'mahatma gandhi': 'Mahatma Gandhi was a leader of India\'s non-violent independence movement against British rule, and he is known as the Father of the Nation.',
        'kathak': 'Kathak is one of the eight classical dances of India, originating from the northern regions and characterized by intricate footwork and expressive gestures.',
        'sanskrit': 'Sanskrit is an ancient Indian language and the liturgical language of Hinduism, Buddhism, and Jainism, known for its rich literary tradition.',
        'ganesh chaturthi': 'Ganesh Chaturthi is a Hindu festival celebrating the birth of Lord Ganesha, the elephant-headed god of wisdom and prosperity.',
        'ayurveda': 'Ayurveda is an ancient Indian system of medicine that focuses on holistic health, balancing the mind, body, and spirit through natural remedies.',
        'cricket': 'Cricket is the most popular sport in India, with a massive following and a rich history, especially known for legendary players like Sachin Tendulkar.',
        'tell me about indians' : 'Indians are the people of India, a diverse and culturally rich country in South Asia.',
        'who build you' : 'To build me! , I have Amit Kumar Sahu,Sanskar kesharwani,Tarang koshti,Sneha , uday jhariya and ashutosh tiwari.',
        'hello': 'Hello How can I help?',
        'distance between jammu and kerala' : 'The distance between jammu and kerala is 3,284 kilo metres',
        'sari' : 'The sari is a traditional garment worn by women in India. It is a long piece of cloth, usually about 6 to 9 yards in length, draped elegantly around the body. The sari is not just a piece of clothing but a symbol of grace, beauty, and cultural heritage. Different regions in India have their own unique styles of draping a sari, reflecting the diversity of Indian culture.',
        'namaste' : 'Namaste is a traditional Indian greeting, which means "I bow to you." The word is derived from Sanskrit and is often accompanied by a slight bow made with hands pressed together, palms touching and fingers pointing upwards, thumbs close to the chest. It signifies respect, reverence, and acknowledgment of the divine in others.',
        'capital of bhopal' : 'The Capital of madhya pradesh is bhopal',
        'capital of india' : 'The capital of India is New Delhi',

    };

  
    for (const keyword in responses) {
        if (normalizedInput.includes(keyword)) {
            botMessageText = responses[keyword];
            break;
        }
    }

  
    if (!botMessageText) {
        botMessageText = 'Sorry, I am not sure about that. Can you please ask something else related to Indian culture?';
    }

    appendBotMessage(botMessageText);
}

    



function appendBotMessage(message) {
    const chatBody = document.querySelector('.chatbot-body');
    const botMessage = document.createElement('div');
    botMessage.className = 'chat-message bot-message';
    botMessage.textContent = message;
    chatBody.appendChild(botMessage);
    speak(message);
    scrollToBottom();
}


function handleSuggestionClick(suggestion) {
    document.getElementById('user-input').value = suggestion;
    sendMessage();
}


function speak(text) {
    const utterance = new SpeechSynthesisUtterance(text);
    window.speechSynthesis.speak(utterance);
}


function scrollToBottom() {
    const chatBody = document.querySelector('.chatbot-body');
    chatBody.scrollTop = chatBody.scrollHeight;
}
