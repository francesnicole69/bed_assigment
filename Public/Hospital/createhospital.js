// Hospital form handling
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('hospitalForm');
    const messageDiv = document.getElementById('message');

    form.addEventListener('submit', async function(e) {
        e.preventDefault();
        await submitHospital();
    });

    // Auto-hide message after 5 seconds
    function showMessage(text, type) {
        messageDiv.textContent = text;
        messageDiv.className = `message ${type}`;
        messageDiv.style.display = 'block';
        
        if (type === 'success' || type === 'error') {
            setTimeout(() => {
                messageDiv.style.display = 'none';
            }, 5000);
        }
    }

    // Submit hospital data
    async function submitHospital() {
        const formData = new FormData(form);
        
        const hospitalData = {
            Name: formData.get('name').trim(),
            Address: formData.get('address').trim(),
            Latitude: parseFloat(formData.get('latitude')),
            Longitude: parseFloat(formData.get('longitude')),
            Phone: formData.get('phone').trim(),
            OpeningHours: formData.get('openingHours').trim()
        };

        // Validation
        if (!validateHospitalData(hospitalData)) {
            return;
        }

        try {
            showMessage('Adding hospital...', 'loading');
            
            const response = await fetch('/hospitals', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(hospitalData)
            });

            const result = await response.json();

            if (response.ok) {
                showMessage('Hospital added successfully!', 'success');
                form.reset();
                
                // Redirect to admin page after 2 seconds
                setTimeout(() => {
                    window.location.href = 'adminhospital.html';
                }, 2000);
            } else {
                showMessage(result.error || 'Error adding hospital', 'error');
            }
        } catch (error) {
            console.error('Error:', error);
            showMessage('Network error. Please try again.', 'error');
        }
    }

    // Validate hospital data
    function validateHospitalData(data) {
        if (!data.Name || data.Name.length < 2) {
            showMessage('Hospital name must be at least 2 characters long', 'error');
            return false;
        }

        if (!data.Address || data.Address.length < 10) {
            showMessage('Please provide a complete address', 'error');
            return false;
        }

        if (isNaN(data.Latitude) || data.Latitude < -90 || data.Latitude > 90) {
            showMessage('Latitude must be a valid number between -90 and 90', 'error');
            return false;
        }

        if (isNaN(data.Longitude) || data.Longitude < -180 || data.Longitude > 180) {
            showMessage('Longitude must be a valid number between -180 and 180', 'error');
            return false;
        }

        if (!data.Phone || data.Phone.length < 8) {
            showMessage('Please provide a valid phone number', 'error');
            return false;
        }

        if (!data.OpeningHours || data.OpeningHours.length < 3) {
            showMessage('Please provide opening hours information', 'error');
            return false;
        }

        return true;
    }

    // Auto-format phone number
    document.getElementById('phone').addEventListener('input', function(e) {
        let value = e.target.value.replace(/\D/g, '');
        if (value.startsWith('65')) {
            value = '+' + value;
        } else if (value.startsWith('6') && value.length > 1) {
            value = '+65 ' + value.substring(1);
        }
        e.target.value = value;
    });

    // Coordinate validation
    document.getElementById('latitude').addEventListener('input', function(e) {
        const value = parseFloat(e.target.value);
        if (!isNaN(value) && (value < -90 || value > 90)) {
            e.target.setCustomValidity('Latitude must be between -90 and 90');
        } else {
            e.target.setCustomValidity('');
        }
    });

    document.getElementById('longitude').addEventListener('input', function(e) {
        const value = parseFloat(e.target.value);
        if (!isNaN(value) && (value < -180 || value > 180)) {
            e.target.setCustomValidity('Longitude must be between -180 and 180');
        } else {
            e.target.setCustomValidity('');
        }
    });
});

// Go back function
function goBack() {
    if (confirm('Are you sure you want to cancel? Any unsaved changes will be lost.')) {
        window.location.href = 'adminhospital.html';
    }
}
