
unit EditENSiteFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSiteController ;

type
  TfrmENSiteFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblSiteaddress : TLabel;
    edtSiteaddress: TEdit;

    lblSitephone : TLabel;
    edtSitephone: TEdit;



  HTTPRIOENSite: THTTPRIO;

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
  frmENSiteFilterEdit: TfrmENSiteFilterEdit;
  ENSiteFilterObj: ENSiteFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSiteController  ;
}
{$R *.dfm}



procedure TfrmENSiteFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSiteObj.name; 



    edtSiteaddress.Text := ENSiteObj.siteaddress; 



    edtSitephone.Text := ENSiteObj.sitephone; 


  end;

}

end;



procedure TfrmENSiteFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSite: ENSiteControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSiteFilterObj.name := edtName.Text; 



     ENSiteFilterObj.siteaddress := edtSiteaddress.Text; 



     ENSiteFilterObj.sitephone := edtSitephone.Text; 




  end;
end;




end.