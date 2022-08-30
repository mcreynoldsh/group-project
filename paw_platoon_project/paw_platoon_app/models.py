from django.contrib.auth.models import (AbstractUser)
from django.db import models
from django.utils.translation import gettext_lazy as _


class BaseManager(models.Manager):
    def get_by_natural_key(self, id, name):
        return self.get(id=id, name=name)


class Base(models.Model):
    name = models.CharField(max_length=255, unique=True)

    class Meta:
        unique_together = [['id', 'name']]

    def natural_key(self):
        return (self.id, self.name)


class User(AbstractUser):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    bases = models.ManyToManyField(Base)
    address = models.CharField(max_length=255)
    profile_pic = models.ImageField(
        _("Image"), upload_to='users/', default='users/default-profile-icon.jpg')
    is_provider = models.BooleanField(default=False)
    is_user = models.BooleanField(default=False)
    rate = models.CharField(max_length=255, blank=True, default='$25')
    bio = models.TextField(blank=True)
    zip_code = models.CharField(max_length=5, default='79606')
    avg_rating = models.DecimalField(blank=True,default=0, max_digits=2, decimal_places=1)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []  # Email & Password are required by default.

    def __str__(self):
        return self.email


class Walker(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.__str__()


class AppUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    walker = models.ForeignKey(
        Walker,
        on_delete=models.CASCADE,
        null=True,
        blank=True)

    def __str__(self):
        return self.user.__str__()


class Pet(models.Model):
    name = models.CharField(max_length=255)
    species = models.CharField(max_length=255)
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    weight = models.CharField(max_length=255)
    age = models.CharField(max_length=255)
    pet_pic = models.ImageField(
        _("Image"), upload_to='pets/', default='pets/default-pet-pic.jpg')

    def __str__(self):
        return self.name

    def natural_key(self):
        return (self.id, self.name)


class Walk(models.Model):
    walker = models.ForeignKey(Walker, on_delete=models.CASCADE)
    pets = models.ManyToManyField(Pet, related_name="walks")
    date = models.CharField(max_length=255)
    walk_length = models.CharField(max_length=255, blank=True)
    walk_time = models.CharField(max_length=255)
    notes = models.TextField(blank=True)
    complete = models.BooleanField(default=False)
    owner = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        null=True,
        blank=True)
    walk_track = models.JSONField(default=dict)

class Rating(models.Model):
    ratee = models.ForeignKey(User, on_delete=models.CASCADE, related_name="user_ratings")
    rater = models.ForeignKey(User, on_delete=models.CASCADE)
    star_rating = models.PositiveSmallIntegerField()
    comment = models.TextField(blank=True)
    date = models.DateField(auto_now_add=True)
