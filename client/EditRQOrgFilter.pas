
unit EditRQOrgFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrgController ;

type
  TfrmRQOrgFilterEdit = class(TDialogForm)

    lblId : TLabel;
    edtId: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblUkr_name : TLabel;
    edtUkr_name: TEdit;
    lblOkpo : TLabel;
    edtOkpo: TEdit;
    lblNalog_num : TLabel;
    edtNalog_num: TEdit;
    lblSvidet_num : TLabel;
    edtSvidet_num: TEdit;
    lblAdr : TLabel;
    edtAdr: TEdit;
    lblTel : TLabel;
    edtTel: TEdit;
    lblCountry : TLabel;
    edtCountry: TEdit;
    lblRegion : TLabel;
    edtRegion: TEdit;
    lblMinistry : TLabel;
    edtMinistry: TEdit;
    lblPrimechan : TLabel;
    edtPrimechan: TEdit;


  HTTPRIORQOrg: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtPartnerCode: TEdit;
    lblPartnerCode: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQOrgFilterEdit: TfrmRQOrgFilterEdit;
  RQOrgFilterObj: RQOrgFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrgController  ;
}
{$R *.dfm}



procedure TfrmRQOrgFilterEdit.FormShow(Sender: TObject);
begin
//
 //
end;



procedure TfrmRQOrgFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempRQOrg: RQOrgControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

    if ( edtId.Text <> '' ) then
     RQOrgFilterObj.id := StrToInt(edtId.Text)
    else
     RQOrgFilterObj.id := Low(Integer) ;

     RQOrgFilterObj.name := edtName.Text;
     RQOrgFilterObj.ukr_name := edtUkr_name.Text;
     RQOrgFilterObj.okpo := edtOkpo.Text;
     RQOrgFilterObj.nalog_num := edtNalog_num.Text;
     RQOrgFilterObj.svidet_num := edtSvidet_num.Text;
     RQOrgFilterObj.adr := edtAdr.Text;
     RQOrgFilterObj.tel := edtTel.Text;
     RQOrgFilterObj.country := edtCountry.Text;
     RQOrgFilterObj.region := edtRegion.Text;
     RQOrgFilterObj.ministry := edtMinistry.Text;

     RQOrgFilterObj.codeorg := edtPartnerCode.Text;

     //RQOrgFilterObj.Primechan := edtPrimechan.Text;
  end;
end;




end.