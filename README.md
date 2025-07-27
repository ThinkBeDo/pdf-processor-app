# PDF Processor App

## Healthcare Staffing Document Management Tool

This application provides two main functions for healthcare staffing companies:

### 🔗 PDF Merger
- Upload multiple PDF files
- Merge them into a single document
- Perfect for combining multiple documents into one packet

### ✂️ Smart DocuSign Packet Splitter
- Upload a complete DocuSign application packet
- Automatically splits into two files:
  - **Facility-Safe PDF**: Contains policies, procedures, and skills checklists (safe to share with facilities)
  - **Private PDF**: Contains contracts, authorization forms, and sensitive personal information (keep confidential)

## Features

- **Intelligent Name Extraction**: Automatically extracts employee names from PDFs for proper file naming
- **Drag & Drop Interface**: Easy file uploads with visual feedback
- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **Client-Side Processing**: All PDF processing happens in your browser for maximum security
- **No File Storage**: Files are never uploaded to servers - everything happens locally

## Facility-Safe Content Includes:
- Abuse/Neglect Policy
- Hepatitis B Vaccine Verification
- HIPAA Privacy Protection
- Workplace Violence Policies
- OSHA Standards & Safety Procedures
- Skills Checklists (Medical/Surgical for LPN, CNA Skills for CNA)

## Private/Sensitive Content Includes:
- Contract Agreements
- Authorization Forms (containing SSN)
- Workers' Compensation Forms
- W-9 Tax Forms
- Personal addresses and contact information

## Technology

- **Frontend**: Pure HTML, CSS, JavaScript
- **PDF Processing**: PDF-lib.js for client-side PDF manipulation
- **Deployment**: Docker + Nginx for static file serving
- **Hosting**: Railway.app ready

## Local Development

1. Clone the repository
2. Open `index.html` in your browser
3. Start processing PDFs!

## Deployment

This app is configured for easy deployment on Railway:

1. Connect your GitHub repository to Railway
2. Railway will automatically detect the Dockerfile
3. Deploy with zero configuration needed

## Security

- All processing happens client-side
- No files are uploaded to servers
- No data leaves your browser
- Perfect for handling sensitive healthcare documents

## Support

For questions or issues, please contact the development team.
