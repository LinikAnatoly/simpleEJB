
unit EditENPlanProjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanProjectController ;

type
  TfrmENPlanProjectFilterEdit = class(TDialogForm)

    lblProjectCipher : TLabel;
    edtProjectCipher: TEdit;

    lblProjectName : TLabel;
    edtProjectName: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENPlanProject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanProjectFilterEdit: TfrmENPlanProjectFilterEdit;
  ENPlanProjectFilterObj: ENPlanProjectFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanProjectController  ;
}
{$R *.dfm}



procedure TfrmENPlanProjectFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtProjectCipher
      ,edtProjectName
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtProjectCipher.Text := ENPlanProjectObj.projectCipher; 



    edtProjectName.Text := ENPlanProjectObj.projectName; 



    edtUserGen.Text := ENPlanProjectObj.userGen; 



      if ENPlanProjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanProjectObj.dateEdit.Year,ENPlanProjectObj.dateEdit.Month,ENPlanProjectObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENPlanProjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanProject: ENPlanProjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanProjectFilterObj.projectCipher := edtProjectCipher.Text; 



     ENPlanProjectFilterObj.projectName := edtProjectName.Text; 



     ENPlanProjectFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENPlanProjectFilterObj.dateEdit = nil then
          ENPlanProjectFilterObj.dateEdit := TXSDateTime.Create;
       ENPlanProjectFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPlanProjectFilterObj.dateEdit := nil;




  end;
end;




end.