
unit EditENIPPurposeProgramFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPPurposeProgramController ;

type
  TfrmENIPPurposeProgramFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENIPPurposeProgram: THTTPRIO;

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
  frmENIPPurposeProgramFilterEdit: TfrmENIPPurposeProgramFilterEdit;
  ENIPPurposeProgramFilterObj: ENIPPurposeProgramFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIPPurposeProgramController  ;
}
{$R *.dfm}



procedure TfrmENIPPurposeProgramFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENIPPurposeProgramObj.name; 


  end;

}

end;



procedure TfrmENIPPurposeProgramFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENIPPurposeProgramFilterObj.name := edtName.Text; 




  end;
end;




end.