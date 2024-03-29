import '../models/author_model.dart';

class Blog {
  String imageUrl;
  String name;
  Author author;
  bool liked;
  String created_at;
  String content;

  Blog(
      {required this.imageUrl,
      required this.name,
      required this.author,
      required this.liked,
      required this.created_at,
      required this.content});
}

final List<Blog> blogs = [
  Blog(
    imageUrl: 'assets/images/blog1.jpg',
    name: 'Protecting Yourself from Phishing Attacks',
    author: mark,
    liked: false,
    created_at: "2 hours ago",
    content: '''
Phishing is a common cyber threat that involves attackers sending fraudulent emails or messages designed to trick recipients into revealing sensitive information or clicking on malicious links. These attacks can lead to identity theft, financial losses, or system compromises.

How to Recognize Phishing Attacks

1. Suspicious Sender: Be wary of emails from unfamiliar or unexpected sources, especially those claiming to be from reputable organizations or companies.

2. Urgent Tone: Phishing emails often create a sense of urgency or fear, pressuring you to act quickly without verifying the legitimacy of the request.

3. Spelling and Grammar Mistakes: Legitimate organizations typically have professional communications staff, so emails with numerous spelling or grammar errors should raise suspicion.

4. Requests for Sensitive Information: Reputable companies will never ask for sensitive information like passwords, credit card numbers, or social security numbers via email.

5. Suspicious Links or Attachments: Hover over links to verify the actual destination before clicking, and be cautious about opening attachments from unknown sources.

How to Avoid Phishing Attacks

1. Verify the Sender: If an email seems suspicious, contact the supposed sender through official channels to confirm its legitimacy.

2. Be Cautious with Personal Information: Never provide sensitive information in response to unsolicited emails or messages.

3. Use Anti-Phishing Tools: Utilize email filters, anti-phishing browser extensions, and other security tools to help detect and block phishing attempts.

4. Keep Software Updated: Regularly update your operating system, web browsers, and other software to ensure you have the latest security patches and protections.

5. Be Vigilant: Maintain a healthy skepticism towards unsolicited communications and be cautious when considering any requests or actions.

By understanding the tactics used in phishing attacks and following these best practices, you can significantly reduce your risk of falling victim to this common cyber threat.
''',
  ),
  Blog(
    imageUrl: 'assets/images/blog2.jpg',
    name: 'Defending Against Malware Threats',
    author: sam,
    liked: false,
    created_at: "1 day ago",
    content: '''
Malware, short for malicious software, is a broad term that encompasses various types of harmful programs designed to disrupt, damage, or gain unauthorized access to computer systems. Malware can take the form of viruses, worms, trojans, ransomware, and more.

Common Types of Malware

1. Viruses: Self-replicating programs that attach themselves to other files and can cause various types of damage or disruption.

2. Worms: Standalone programs that replicate themselves across networks, consuming bandwidth and resources.

3. Trojans: Malicious programs that disguise themselves as legitimate software, often allowing attackers to gain remote access to systems.

4. Ransomware: Malware that encrypts files or locks systems, demanding a ransom payment for the decryption key or unlock code.

Protecting Against Malware

1. Keep Software Updated: Regularly update your operating system, web browsers, and other software to patch known vulnerabilities.

2. Use Anti-Malware Solutions: Install and maintain up-to-date anti-virus, anti-spyware, and anti-malware programs to detect and remove malicious software.

3. Practice Safe Browsing: Exercise caution when visiting unfamiliar websites, downloading files, or opening attachments from untrusted sources.

4. Back Up Data Regularly: Maintain regular backups of important files and data to recover from potential malware infections or ransomware attacks.

5. Educate Yourself and Others: Stay informed about the latest malware threats and share knowledge with colleagues, friends, and family to promote safer online practices.

By understanding the various types of malware and implementing proactive security measures, you can significantly reduce the risk of falling victim to these cyber threats.
''',
  ),
  Blog(
    imageUrl: 'assets/images/blog3.jpg',
    name: 'Strengthening Your Password Security',
    author: john,
    liked: true,
    created_at: "3 days ago",
    content: '''
Passwords are the gatekeepers to our online accounts and sensitive information, yet many people still underestimate the importance of strong password practices. Weak or reused passwords can leave you vulnerable to account compromises, identity theft, and other cyber threats.

Best Practices for Password Security

1. Use Unique Passwords: Never reuse the same password across multiple accounts or services. If one account is compromised, all others using the same password become vulnerable.

2. Create Strong Passwords: Aim for long, complex passwords that include a combination of uppercase and lowercase letters, numbers, and special characters.

3. Avoid Personal Information: Do not incorporate easily guessable information like names, birthdates, or common words into your passwords.

4. Use a Password Manager: Consider using a reputable password manager to generate, store, and retrieve strong, unique passwords for all your accounts.

5. Enable Two-Factor Authentication: Whenever possible, enable two-factor or multi-factor authentication for an additional layer of security beyond just a password.

6. Update Passwords Regularly: Periodically change your passwords, especially for critical accounts or if you suspect a potential compromise.

7. Be Cautious with Password Sharing: Avoid sharing passwords with others, and be wary of unsolicited requests for your login credentials.

By implementing these password security best practices, you can significantly reduce the risk of account compromises and protect your personal and sensitive information from cyber threats.
''',
  ),
];
