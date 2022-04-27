
unit EditENTraversTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTraversTypeController ;

type
  TfrmENTraversTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENTraversType: THTTPRIO;

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
  frmENTraversTypeFilterEdit: TfrmENTraversTypeFilterEdit;
  ENTraversTypeFilterObj: ENTraversTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTraversTypeController  ;
}
{$R *.dfm}



procedure TfrmENTraversTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTraversTypeObj.name; 


  end;

}

end;



procedure TfrmENTraversTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTraversType: ENTraversTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTraversTypeFilterObj.name := edtName.Text; 




  end;
end;




end.