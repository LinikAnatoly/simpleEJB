
unit EditENSpravMol;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSpravMolController ;

type
  TfrmENSpravMolEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMolkod : TLabel;
    edtMolkod: TEdit;
    lblMolname : TLabel;
    edtMolname: TMemo;

  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  

  HTTPRIOENSpravMol: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSpravMolEdit: TfrmENSpravMolEdit;
  ENSpravMolObj: ENSpravMol;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
;

{uses  
    EnergyproController, EnergyproController2, ENSpravMolController  ;
}
{$R *.dfm}



procedure TfrmENSpravMolEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENDepartmentDepartmentName
      ,spbENDepartmentDepartment
      
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMolkod
      ,edtMolname
      , edtENDepartmentDepartmentName
     ]);
     DisableControls([
      edtENDepartmentDepartmentName
       ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSpravMolObj.code);
    edtMolkod.Text := ENSpravMolObj.molkod; 
    MakeMultiline(edtMolname.Lines, ENSpravMolObj.molname);

    edtENDepartmentDepartmentName.Text := ENSpravMolObj.department.name;

  end;
end;



procedure TfrmENSpravMolEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSpravMol: ENSpravMolControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMolkod
      ,edtMolname
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSpravMol := HTTPRIOENSpravMol as ENSpravMolControllerSoapPort;


     ENSpravMolObj.molkod := edtMolkod.Text; 

     ENSpravMolObj.molname := edtMolname.Text; 

    if DialogState = dsInsert then
    begin
      ENSpravMolObj.code:=low(Integer);
      TempENSpravMol.add(ENSpravMolObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSpravMol.save(ENSpravMolObj);
    end;
  end;
end;


procedure TfrmENSpravMolEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal,f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSpravMolObj.department = nil then ENSpravMolObj.department := ENDepartment.Create();
               // ENSpravMolObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               // edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
               ENSpravMolObj.department.code :=  ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:=  ENDepartmentShort(tvDep.Selected.Data).shortName;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



end.