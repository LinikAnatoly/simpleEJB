
unit EditENCustomerServicesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENCustomerServicesController, CheckLst;

type
    TfrmENCustomerServicesFilterEdit = class(TDialogForm)

    lblCustomerName : TLabel;
    edtCustomerName: TEdit;
    edtCustomerAddress: TEdit;
    HTTPRIOENCustomerServices: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    gbPeriodRegistration: TGroupBox;
    edtDateRegistrationStart: TDateTimePicker;
    edtDateRegistrationEnd: TDateTimePicker;
    lblCustomerAddress: TLabel;
    lblObjectsAddress: TLabel;
    edtObjectsAddress: TEdit;
    chkServicesList: TCheckListBox;
    spbSelectAllServices: TSpeedButton;
    spbClearAllServices: TSpeedButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbSelectAllServicesClick(Sender: TObject);
    procedure spbClearAllServicesClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

end;


var
  frmENCustomerServicesFilterEdit: TfrmENCustomerServicesFilterEdit;
  ENCustomerServicesFilterObj: ENCustomerServicesFilter;


implementation


{$R *.dfm}


var
  servicesList: array [0..14] of String =
  (
    'Дзвінок',
    'Вхідна кореспонденція',
    'Договір про постачання е/е',
    'Договір про розподіл е/е',
    'Заява побутового споживача',
    'Звернення споживача',
    'Договори на виконання робіт',
    'ОКСН',
    'Охорона',
    'Підключення за заявкою постачальника',
    'Послуги на сторону',
    'Приєднання',
    'Продаж',
    'Проектування',
    'ТУ'
  );


procedure TfrmENCustomerServicesFilterEdit.FormShow(Sender: TObject);
var
  i: Integer;
begin
  DenyBlankValues([edtCustomerName, edtCustomerAddress, edtObjectsAddress]);

  for i:=Low(servicesList) to High(servicesList) do
  begin
    chkServicesList.Items.AddObject(servicesList[i], TObject(i));
  end;

  spbSelectAllServicesClick(Sender);
end;


procedure TfrmENCustomerServicesFilterEdit.spbClearAllServicesClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i:=0 to chkServicesList.Count -1  do
  begin
    if chkServicesList.Checked[i] = True then
      chkServicesList.Checked[i] := False;
  end;
end;


procedure TfrmENCustomerServicesFilterEdit.spbSelectAllServicesClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  for i:=0 to chkServicesList.Count -1 do
  begin
    if chkServicesList.Checked[i] = False then
      chkServicesList.Checked[i] := True;
  end;
end;


procedure TfrmENCustomerServicesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  i: Integer;
  TempENCustomerServices: ENCustomerServicesControllerSoapPort;
  condition, serviceCodes: String;
  isFiltered: Boolean;
begin
  isFiltered := False;

  if (ModalResult = mrOk)  then
  begin
    condition := '';

    if edtCustomerName.Text <> '' then
    begin
      ENCustomerServicesFilterObj.customerName := edtCustomerName.Text;

      isFiltered := True;
    end;

    if edtCustomerAddress.Text <> '' then
    begin
      ENCustomerServicesFilterObj.customerAddress := edtCustomerAddress.Text;

      isFiltered := True;
    end;

    if edtObjectsAddress.Text <> '' then
    begin
      ENCustomerServicesFilterObj.objectsAddress := edtObjectsAddress.Text;

      isFiltered := True;
    end;

    if edtDateRegistrationStart.Checked then
    begin
      AddCondition(condition, ' dateregistration >= to_date('''
        + DateToStr(edtDateRegistrationStart.Date) + ''', ''dd.MM.yyyy'')');

      isFiltered := True;
    end;

    if edtDateRegistrationEnd.Checked then
    begin
      AddCondition(condition, ' dateregistration <= to_date('''
        + DateToStr(edtDateRegistrationEnd.Date) + ''', ''dd.MM.yyyy'')');

      isFiltered := True;
    end;


    serviceCodes := '';
    for i:=0 to chkServicesList.Count-1 do
    begin
      if chkServicesList.Checked[i] then
        if serviceCodes <> '' then
          serviceCodes := serviceCodes + ', ' + IntToStr(Integer(chkServicesList.Items.Objects[i]))
        else
          serviceCodes := IntToStr(Integer(chkServicesList.Items.Objects[i]));
    end;


    if serviceCodes <> '' then
    begin
      AddCondition(condition, ' servicecode in (' + serviceCodes + ') ');
      isFiltered := True;
    end;


    if isFiltered then
    begin
      if condition <> '' then
        ENCustomerServicesFilterObj.conditionSQL := condition;
    end;


    if not isFiltered then
    begin
      Application.MessageBox(PChar('Виберіть хоча б один критерій пошуку...'), PChar('Увага'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

  end;
end;


end.