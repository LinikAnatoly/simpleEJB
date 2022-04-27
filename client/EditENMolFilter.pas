
unit EditENMolFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolController ;

type
  TfrmENMolFilterEdit = class(TDialogForm)



  HTTPRIOENMol: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblFinCode: TLabel;
    lblName: TLabel;
    lblType: TLabel;
    spbType: TSpeedButton;
    lblStatus: TLabel;
    spbStatus: TSpeedButton;
    edtFinCode: TEdit;
    edtName: TEdit;
    edtType: TEdit;
    edtStatus: TEdit;
    lblPhoneNumber: TLabel;
    edtPhoneNumber: TEdit;
    lblTabNumber: TLabel;
    edtTabNumber: TEdit;
    lblENDepartment: TLabel;
    edtENDepartment: TEdit;
    spbENDepartment: TSpeedButton;
    spbENDepartmentClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTypeClick(Sender: TObject);
    procedure spbStatusClick(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMolFilterEdit: TfrmENMolFilterEdit;
  ENMolFilterObj: ENMolFilter;

implementation

uses ShowENMolType, ShowENMolStatus, ENMolTypeController, ENMolStatusController
, ShowENDepartment, ENDepartmentController;

{$R *.dfm}

procedure TfrmENMolFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtType, edtStatus, edtENDepartment]);
end;

procedure TfrmENMolFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENMol: ENMolControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
     ENMolFilterObj.finCode := edtFinCode.Text;
     ENMolFilterObj.name := edtName.Text;
     ENMolFilterObj.phoneNumber := edtPhoneNumber.Text;
     ENMolFilterObj.tabNumber:= edtTabNumber.Text;

  end;
end;

procedure TfrmENMolFilterEdit.spbTypeClick(Sender: TObject);
var
   frmENMolTypeShow: TfrmENMolTypeShow;
begin
   frmENMolTypeShow := TfrmENMolTypeShow.Create(Application, fmNormal);
   try
      with frmENMolTypeShow do
      begin
        DisableActions([actInsert, actDelete, actEdit]);
        if ShowModal = mrOk then
        begin
            try
               if ENMolFilterObj.typeRef = nil then ENMolFilterObj.typeRef := ENMolTypeRef.Create();
               ENMolFilterObj.typeRef.code := StrToInt(GetReturnValue(sgENMolType, 0));
               edtType.Text := GetReturnValue(sgENMolType, 1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENMolTypeShow.Free;
   end;
end;

procedure TfrmENMolFilterEdit.spbENDepartmentClearClick(Sender: TObject);
begin
  inherited;
  if (not Assigned(ENMolFilterObj))
    or (not Assigned(ENMolFilterObj.departmentRef)) then begin
    Exit;
  end;

  ENMolFilterObj.departmentRef.code := Low(Integer);
  edtENDepartment.Text := '';
end;

procedure TfrmENMolFilterEdit.spbENDepartmentClick(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
       if not Assigned(ENMolFilterObj) then begin
		       ENMolFilterObj := ENMolFilter.Create;
		   end;

		   if not Assigned(ENMolFilterObj.departmentRef) then begin
		       ENMolFilterObj.departmentRef := ENDepartmentRef.Create;
		   end;

       ENMolFilterObj.departmentRef.code := selectedObj.code;
       edtENDepartment.Text := selectedObj.shortName;
  end);
end;

procedure TfrmENMolFilterEdit.spbStatusClick(Sender: TObject);
var
   frmENMolStatusShow: TfrmENMolStatusShow;
begin
   frmENMolStatusShow := TfrmENMolStatusShow.Create(Application, fmNormal);
   try
      with frmENMolStatusShow do
      begin
        DisableActions([actInsert, actDelete, actEdit]);
        if ShowModal = mrOk then
        begin
            try
               if ENMolFilterObj.statusRef = nil then ENMolFilterObj.statusRef := ENMolStatusRef.Create();
               ENMolFilterObj.statusRef.code := StrToInt(GetReturnValue(sgENMolStatus, 0));
               edtStatus.Text := GetReturnValue(sgENMolStatus, 1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENMolStatusShow.Free;
   end;
end;

end.