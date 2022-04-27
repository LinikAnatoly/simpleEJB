unit EditSorting;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, TreeList, AdvObj, AdvListV, Generics.Collections;

type
  TSortingRecord = class
    Fkey : String;
    Fdirection : String;
    Fcaption : String;
    constructor Create(k: string; d : string; c : string);
  published
    property Key : string read Fkey;
    property Direction : string read Fdirection write Fdirection;
    property Caption : string read Fcaption;
  end;
type
  TfrmSortingEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    imageList: TImageList;
    listFields: TAdvListView;
    listFieldsAll: TAdvListView;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    btnLeft: TSpeedButton;
    btnRight: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure listFieldsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnLeftClick(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
  private
    fields : TList<TSortingRecord>;
    preSelectedKeysNames : TList<string>;
    preSelectedKeysNamesAndDirections : TDictionary<string, string>;
    procedure addItemLeft(field : TSortingRecord);
    procedure addItemRight(field : TSortingRecord);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent;
                       DialogState: TDialogState; fields : TList<TSortingRecord>;
                       preSelectedKeys : string); reintroduce; overload;
    function GetString : string;
    { Public declarations }

end;


implementation

uses Generics.Defaults, Math;
{uses
    EnergyproController, EnergyproController2, SortingController  ;
}
{$R *.dfm}

constructor TSortingRecord.Create(k : string; d : string; c : string);
begin
  Fkey := k;
  Fdirection := d;
  Fcaption := c;
end;

procedure TfrmSortingEdit.btnDownClick(Sender: TObject);
var
  currIndex, imageCurrIndex, imageLowerIndex : Integer;
  temp, currentItem, lowerItem : TListItem;
begin
  inherited;
  if (listFields.ItemIndex < listFields.Items.Count - 1) then begin
    currIndex := listFields.ItemIndex;
    currentItem := listFields.Items[currIndex];
    imageCurrIndex := currentItem.SubItemImages[0];
    temp := TListItem.Create(listFields.Items);
    temp.Assign(currentItem);
    lowerItem := listFields.Items[currIndex + 1];
    imageLowerIndex := lowerItem.SubItemImages[0];
    currentItem.Assign(lowerItem);
    currentItem.SubItemImages[0] := imageLowerIndex;
    lowerItem.Assign(temp);
    lowerItem.SubItemImages[0] := imageCurrIndex;
    listFields.SelectItem(currIndex + 1);
  end;
end;

procedure TfrmSortingEdit.btnLeftClick(Sender: TObject);
var
  swapItem : TListItem;
  swapRecord : TSortingRecord;
  index : Integer;
begin
  inherited;
  swapItem := listFieldsAll.Selected;
  if Assigned(swapItem) then begin
    index := swapItem.Index;
    swapItem.Delete;
    swapRecord := TSortingRecord(swapItem.Data);
    Self.addItemLeft(swapRecord);
    if listFieldsAll.Items.Count > 0 then begin
     listFieldsAll.SetFocus;
     if index >= listFieldsAll.Items.Count then index := listFieldsAll.Items.Count - 1;
     listFieldsAll.SelectItem(index);
    end;
  end;
end;

procedure TfrmSortingEdit.btnRightClick(Sender: TObject);
var
  swapItem : TListItem;
  swapRecord : TSortingRecord;
  index : Integer;
begin
  inherited;
  swapItem := listFields.Selected;
  if Assigned(swapItem) then begin
    index := swapItem.Index;
    swapItem.Delete;
    swapRecord := TSortingRecord(swapItem.Data);
    Self.addItemRight(swapRecord);
    if listFields.Items.Count > 0 then begin
     listFields.SetFocus;
     if index >= listFields.Items.Count then index := listFields.Items.Count - 1;
     listFields.SelectItem(index);
    end;
  end;
end;

procedure TfrmSortingEdit.btnUpClick(Sender: TObject);
var
  currIndex, imageCurrIndex, imageUpperIndex : Integer;
  currentItem, upperItem, temp : TListItem;
begin
  inherited;
  if (listFields.ItemIndex > 0) then begin
    currIndex := listFields.ItemIndex;
    currentItem := listFields.Items[currIndex];
    imageCurrIndex := currentItem.SubItemImages[0];
    temp := TListItem.Create(listFields.Items);
    temp.Assign(currentItem);
    upperItem := listFields.Items[currIndex - 1];
    imageUpperIndex := upperItem.SubItemImages[0];
    currentItem.Assign(upperItem);
    currentItem.SubItemImages[0] := imageUpperIndex;
    upperItem.Assign(temp);
    upperItem.SubItemImages[0] := imageCurrIndex;
    listFields.SelectItem(currIndex - 1);
  end;
end;

constructor TfrmSortingEdit.Create(AOwner: TComponent; DialogState: TDialogState; fields : TList<TSortingRecord>
  ; preSelectedKeys : string);
var
  item, name, direction : String;
  nameAndDirectionText, preSelectedKeysList : TStringList;
begin
  inherited Create(AOwner, DialogState);
  preSelectedKeysList := TStringList.Create;
  preSelectedKeysList.Delimiter := ',';
  preSelectedKeysList.StrictDelimiter := True;
  preSelectedKeysList.DelimitedText := preSelectedKeys;
  preSelectedKeysNames := TList<string>.Create;
  preSelectedKeysNamesAndDirections := TDictionary<string, string>.Create;
  for item in preSelectedKeysList do begin
    nameAndDirectionText := TStringList.Create;
    nameAndDirectionText.Delimiter := ' ';
    nameAndDirectionText.StrictDelimiter := True;
    nameAndDirectionText.DelimitedText := UpperCase(item);
    if nameAndDirectionText.Count = 1 then preSelectedKeysNamesAndDirections.Add(nameAndDirectionText[0], 'ASC');
    if nameAndDirectionText.Count > 1 then begin
      preSelectedKeysNamesAndDirections.Add(nameAndDirectionText[0], nameAndDirectionText[1]);
    end;
    preSelectedKeysNames.Add(nameAndDirectionText[0]);
  end;
  Self.fields := fields;
end;

procedure TfrmSortingEdit.FormShow(Sender: TObject);
var
  field : TSortingRecord;
  item : TListItem;
  CompareSortingRecords : TComparison<TSortingRecord>;
begin
  inherited;
  if Assigned(Self.fields) then begin
      CompareSortingRecords :=
         function(const Left, Right: TSortingRecord): Integer
         var l, r : Integer;
         begin
            with Self.preSelectedKeysNames do begin
              if Contains(UpperCase(Left.key)) then l := IndexOf(UpperCase(Left.key)) else l := fields.IndexOf(Left) + Count;
              if Contains(UpperCase(Right.key)) then r := IndexOf(UpperCase(Right.key)) else r := fields.IndexOf(Right) + Count;
            end;
            Result := CompareValue(l, r);
          end;
      fields.Sort(TComparer<TSortingRecord>.Construct(CompareSortingRecords));
    end;
    for field in Self.fields do begin
      if Assigned(Self.preSelectedKeysNamesAndDirections)
        and Self.preSelectedKeysNamesAndDirections.ContainsKey(UpperCase(field.key)) then begin
        field.Direction := Self.preSelectedKeysNamesAndDirections[UpperCase(field.key)];
        Self.addItemLeft(field);
      end else begin
        Self.addItemRight(field);
      end;
    end;
  end;

procedure TfrmSortingEdit.listFieldsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var item : TListItem;
sortingRecord : TSortingRecord;
  begin
  inherited;
  item := listFields.GetItemAt(4, Y);
  if (X >= listFields.Columns[0].Width) and Assigned(item) then begin
    sortingRecord := TSortingRecord(item.Data);
    if item.SubItemImages[0] = 0 then begin
       item.SubItemImages[0] := 1;
       item.SubItems[0] := 'Спадання';
       sortingRecord.direction := 'DESC';
    end else begin
       item.SubItemImages[0] := 0;
       item.SubItems[0] := 'Зростання';
       sortingRecord.direction := 'ASC';
    end;
  end;
end;

function TfrmSortingEdit.GetString : string;
var item : TListItem;
sorting : String;
sortingRecord : TSortingRecord;
begin
  sorting := '';
  for item in listFields.Items do begin
    sortingRecord := TSortingRecord(item.Data);
    if Length(sorting) > 0 then sorting := sorting + ',';
    with sortingRecord do
      sorting := sorting + key + ' ' + UpperCase(direction);
  end;
  Result := sorting;
end;

procedure TfrmSortingEdit.addItemLeft(field : TSortingRecord);
var item : TListItem;
begin
  item := listFields.Items.Add;
  item.ImageIndex := -1;
  item.Caption := field.caption;
  item.Data := field;
  if CompareStr(UpperCase(field.direction), 'ASC') = 0 then begin
    item.SubItems.Add('Зростання');
    item.SubItemImages[0] := 0;
  end else begin
    item.SubItems.Add('Спадання');
    item.SubItemImages[0] := 1;
  end;
end;
procedure TfrmSortingEdit.addItemRight(field : TSortingRecord);
var item : TListItem;
begin
  item := listFieldsAll.Items.Add;
  item.ImageIndex := -1;
  item.Caption := field.caption;
  item.Data := field;
end;

end.
