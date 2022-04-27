
unit EditENActPostingTypeSumFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActPostingTypeSumController ;

type
  TfrmENActPostingTypeSumFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENActPostingTypeSum: THTTPRIO;

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
  frmENActPostingTypeSumFilterEdit: TfrmENActPostingTypeSumFilterEdit;
  ENActPostingTypeSumFilterObj: ENActPostingTypeSumFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActPostingTypeSumController  ;
}
{$R *.dfm}



procedure TfrmENActPostingTypeSumFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENActPostingTypeSumObj.name; 


  end;

}

end;



procedure TfrmENActPostingTypeSumFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingTypeSum: ENActPostingTypeSumControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActPostingTypeSumFilterObj.name := edtName.Text; 




  end;
end;




end.