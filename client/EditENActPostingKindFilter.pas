
unit EditENActPostingKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActPostingKindController ;

type
  TfrmENActPostingKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENActPostingKind: THTTPRIO;

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
  frmENActPostingKindFilterEdit: TfrmENActPostingKindFilterEdit;
  ENActPostingKindFilterObj: ENActPostingKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActPostingKindController  ;
}
{$R *.dfm}



procedure TfrmENActPostingKindFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENActPostingKindObj.name; 


  end;

}

end;



procedure TfrmENActPostingKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingKind: ENActPostingKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActPostingKindFilterObj.name := edtName.Text; 




  end;
end;




end.