USE myTalentBank;
GO
CREATE INDEX idx_FName ON Applicant (ID)
GO
CREATE INDEX idx_JobsAvailable ON AvailableJobs (ApplicantID)
GO
CREATE INDEX idx_AvailableJobs ON JobPosting (AvailableJobsID)
GO
CREATE INDEX idx_Name ON Jobs (ID)
GO
CREATE INDEX idx_deptartmentID ON JobPosting (ID)
GO
CREATE INDEX idx_hiringTeamID ON JobPosting (ID)
GO
