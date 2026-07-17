# Troubleshooting

## Problem 1

### Apache running but website inaccessible

Apache was active but the website couldn't be reached.

### Solution

- Verified Security Groups
- Verified Apache
- Verified public IP
- Confirmed port 80 was open

---

## Problem 2

### PHP missing

Running

```bash
php -v
```

returned

```text
Command 'php' not found
```

### Solution

Installed PHP and required extensions.

---

## Problem 3

### GitHub download returned 404

The official

```
latest/download/prestashop.zip
```

link no longer existed.

### Solution

Queried the GitHub API and downloaded the versioned release.

---

## Problem 4

### Disk Full during extraction

Received

```
write error (disk full?)
```

### Cause

Ubuntu mounts `/tmp` as a small tmpfs.

### Solution

Moved extraction into the home directory.

---

## Problem 5

### Nested ZIP archive

PrestaShop ships as

```
prestashop_8.2.1.zip

↓

prestashop.zip

↓

Application files
```

### Solution

Extracted both archives.

---

## Problem 6

### Connecting to Amazon RDS

Database connection initially failed.

### Solution

Configured the RDS Security Group to allow MySQL access only from the EC2 Security Group.

---

## Lessons Learned

- Read logs before guessing.
- Verify networking first.
- Security Groups are often the cause.
- Cloud deployments rarely work perfectly the first time.
- Troubleshooting is as important as deployment.
