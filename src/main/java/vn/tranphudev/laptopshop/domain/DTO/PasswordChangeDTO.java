package vn.tranphudev.laptopshop.domain.DTO;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class PasswordChangeDTO {
    @NotEmpty(message = "Current password is required")
    private String currentPassword;

    @NotEmpty(message = "New password is required")
    @Size(min = 6, message = "Password must be at least 6 characters")
    private String newPassword;

    @NotEmpty(message = "Please confirm your new password")
    private String confirmPassword;

    public String getCurrentPassword() {
        return currentPassword;
    }

    public void setCurrentPassword(String currentPassword) {
        this.currentPassword = currentPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}