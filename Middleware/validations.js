const Joi = require("joi");

// Validation schema for hospitals (used for POST/PUT)
const hospitalSchema = Joi.object({
  Name: Joi.string().min(1).max(100).required().messages({
    "string.base": "Name must be a string",
    "string.empty": "Name cannot be empty",
    "string.min": "Name must be at least 1 character long",
    "string.max": "Name cannot exceed 100 characters",
    "any.required": "Name is required",
  }),
  Address: Joi.string().min(1).max(255).required().messages({
    "string.base": "Address must be a string",
    "string.empty": "Address cannot be empty",
    "string.min": "Address must be at least 1 character long",
    "string.max": "Address cannot exceed 255 characters",
    "any.required": "Address is required",
  }),
  Latitude: Joi.number().min(-90).max(90).required().messages({
    "number.base": "Latitude must be a number",
    "number.min": "Latitude must be at least -90",
    "number.max": "Latitude cannot exceed 90",
    "any.required": "Latitude is required",
  }),
  Longitude: Joi.number().min(-180).max(180).required().messages({
    "number.base": "Longitude must be a number",
    "number.min": "Longitude must be at least -180",
    "number.max": "Longitude cannot exceed 180",
    "any.required": "Longitude is required",
  }),
  Phone: Joi.string().min(1).max(30).required().messages({
    "string.base": "Phone must be a string",
    "string.empty": "Phone cannot be empty",
    "string.min": "Phone must be at least 1 character long",
    "string.max": "Phone cannot exceed 30 characters",
    "any.required": "Phone is required",
  }),
  OpeningHours: Joi.string().min(1).max(50).required().messages({
    "string.base": "Opening hours must be a string",
    "string.empty": "Opening hours cannot be empty",
    "string.min": "Opening hours must be at least 1 character long",
    "string.max": "Opening hours cannot exceed 50 characters",
    "any.required": "Opening hours are required",
  }),
});

// Middleware to validate hospital data (for POST/PUT)
function validateHospital(req, res, next) {
  const { error } = hospitalSchema.validate(req.body, { abortEarly: false });
  if (error) {
    const errorMessage = error.details.map((detail) => detail.message).join(", ");
    return res.status(400).json({ error: errorMessage });
  }
  next();
}

module.exports = {
  validateHospital,
};
