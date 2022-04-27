
unit EditENDestinationPoint;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDestinationPointController
  , ENDepartmentController
  , ShowENDepartment ;

type
  TfrmENDestinationPointEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TMemo;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;


  HTTPRIOENDestinationPoint: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtENDepartmentName: TEdit;
    lblENDepartmentName: TLabel;
    spbEnDepartmentName: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEnDepartmentNameClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDestinationPointEdit: TfrmENDestinationPointEdit;
  ENDestinationPointObj: ENDestinationPoint;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDestinationPointController  ;
}
{$R *.dfm}



procedure TfrmENDestinationPointEdit.FormShow(Sender: TObject);
var
department : ENDepartment;
TempENDepartment : ENDepartmentControllerSoapPort;
begin

  DisableControls([edtCode, edtENDepartmentName]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENDestinationPointObj.code);
    MakeMultiline(edtName.Lines, ENDestinationPointObj.name);
    MakeMultiline(edtCommentGen.Lines, ENDestinationPointObj.commentGen);

    // Установление наименования подразделения
    if(ENDestinationPointObj.departmentRef.code <> Low(Integer)) then
    begin
      TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      department := TempENDepartment.getObject(ENDestinationPointObj.departmentRef.code);
      edtENDepartmentName.Text := department.shortName;
    end;


  end;
end;



procedure TfrmENDestinationPointEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDestinationPoint: ENDestinationPointControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDestinationPoint := HTTPRIOENDestinationPoint as ENDestinationPointControllerSoapPort;


     ENDestinationPointObj.name := edtName.Text; 

     ENDestinationPointObj.commentGen := edtCommentGen.Text;


    if DialogState = dsInsert then
    begin
      ENDestinationPointObj.code:=low(Integer);
      TempENDestinationPoint.add(ENDestinationPointObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDestinationPoint.save(ENDestinationPointObj);
    end;
  end;
end;


procedure TfrmENDestinationPointEdit.spbEnDepartmentNameClick(
  Sender: TObject);
 var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
        DisableActions([ actNoFilter, actEdit, actInsert, actDelete ]);
        if ShowModal = mrOk then
        begin
            try
               if ENDestinationPointObj.departmentRef = nil then ENDestinationPointObj.departmentRef := ENDepartmentRef.Create();
               ENDestinationPointObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;


end.