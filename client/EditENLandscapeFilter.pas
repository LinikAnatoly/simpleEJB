
unit EditENLandscapeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLandscapeController ;

type
  TfrmENLandscapeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENLandscape: THTTPRIO;

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
  frmENLandscapeFilterEdit: TfrmENLandscapeFilterEdit;
  ENLandscapeFilterObj: ENLandscapeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLandscapeController  ;
}
{$R *.dfm}



procedure TfrmENLandscapeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENLandscapeObj.name; 


  end;

}

end;



procedure TfrmENLandscapeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENLandscape: ENLandscapeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLandscapeFilterObj.name := edtName.Text; 




  end;
end;




end.