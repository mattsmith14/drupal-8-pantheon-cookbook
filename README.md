# drupal-8-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['drupal-8']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### drupal-8::default

Include `drupal-8` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[drupal-8::default]"
  ]
}
```

## License and Authors

Author:: Matt Smth (<matt@apaxsoftware.com>)
