/**
 * This function requires some attributes to be in the calling component. See src for details.
 */
export function handleError(error) {
    if (error.status === "fail") {
        this.errorList = error.data;        
    } else if (error.status === "error") {
        console.error("Application error see below stack trace for details", error.data);
        this.errorText = "Application Error: " + error.message + " [" + new Date(error.timestamp).toLocaleString() + "]";
        this.errorList = error.data;        
    } else {
        this.errorText = "Internal Server Error: [" + new Date().toLocaleString() + "]";
    }
}