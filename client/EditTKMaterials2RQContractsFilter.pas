unit EditTKMaterials2RQContractsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, TKMaterials2RQContractsController ;

type
  TfrmTKMaterials2RQContractsFilterEdit = class(TDialogForm)

    lblCodeorg : TLabel;
    edtCodeorg: TEdit;

    lblName : TLabel;
    edtName: TEdit;

    lblContractNumber : TLabel;
    edtContractNumber: TEdit;

    lblContractDate : TLabel;
    edtContractDate: TDateTimePicker;



  HTTPRIOTKMaterials2RQContracts: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbTKMaterials: TSpeedButton;
    edtTKMaterials: TEdit;
    lblTKMaterials: TLabel;
    edtResponsiblePerson: TEdit;
    lblResponsiblePerson: TLabel;
    spbResponsiblePerson: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKMaterialsClick(Sender: TObject);
    procedure spbResponsiblePersonClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmTKMaterials2RQContractsFilterEdit: TfrmTKMaterials2RQContractsFilterEdit;
  TKMaterials2RQContractsFilterObj: TKMaterials2RQContractsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, TKMaterials2RQContractsController  ;
}
uses
 TKMaterialsController
,ShowTKMaterials
,ShowENResponsibles
, ENResponsiblesController;
{$R *.dfm}



procedure TfrmTKMaterials2RQContractsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtOrg_id
      ,edtCodeorg
      ,edtName
      ,edtContractNumber
      ,edtContractDate
      ,edtFinDocCode
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( TKMaterials2RQContractsObj.org_id <> Low(Integer) ) then
       edtOrg_id.Text := IntToStr(TKMaterials2RQContractsObj.org_id)
    else
       edtOrg_id.Text := '';



    edtCodeorg.Text := TKMaterials2RQContractsObj.codeorg; 



    edtName.Text := TKMaterials2RQContractsObj.name; 



    edtContractNumber.Text := TKMaterials2RQContractsObj.contractNumber; 



      if TKMaterials2RQContractsObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(TKMaterials2RQContractsObj.contractDate.Year,TKMaterials2RQContractsObj.contractDate.Month,TKMaterials2RQContractsObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;



    edtFinDocCode.Text := TKMaterials2RQContractsObj.finDocCode; 



    if ( TKMaterials2RQContractsObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(TKMaterials2RQContractsObj.finDocID)
    else
       edtFinDocID.Text := '';


  end;

}
DisableControls([edtTKMaterials, edtResponsiblePerson]);
end;

procedure TfrmTKMaterials2RQContractsFilterEdit.spbResponsiblePersonClick(
  Sender: TObject);
var
   frmENResponsiblesShow: TfrmENResponsiblesShow;
   responsibleCode : Integer;
begin
   responsibleCode := Low(Integer);
   frmENResponsiblesShow := TfrmENResponsiblesShow.Create(Application, fmNormal);
   try
      with frmENResponsiblesShow do
        if ShowModal = mrOk then
        begin
            try
              edtResponsiblePerson.Text := GetReturnValue(sgENResponsibles, 1);
              responsibleCode := StrToInt(GetReturnValue(sgENResponsibles, 0));
              if responsibleCode = Low(Integer) then raise Exception.Create('Помилка при визначенні відповідальної особи');

              TKMaterials2RQContractsFilterObj.conditionSQL := ' EXISTS (select code from tkmaterials as ma where ma.code = TKMATERIALS2RQCONTRCTS.MATERIALREFCODE  AND ma.responsiblesrefcode = '  + IntToStr(responsibleCode) + ')';
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENResponsiblesShow.Free;
   end;
end;


procedure TfrmTKMaterials2RQContractsFilterEdit.spbTKMaterialsClick(
  Sender: TObject);
var
   frmTKMAterialsShow: TfrmTKMaterialsShow;
    TempMaterials: TKMaterialsControllerSoapPort;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMAterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if TKMaterials2RQContractsFilterObj.materialRef = nil then TKMaterials2RQContractsFilterObj.materialRef := TKMaterialsRef.Create();
               TKMaterials2RQContractsFilterObj.materialRef.code:=  TKMaterialsShort(tvDep.Selected.Data).code;
               edtTKMaterials.Text:= TKMaterialsShort(tvDep.Selected.Data).name;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMAterialsShow.Free;
   end;
end;

procedure TfrmTKMaterials2RQContractsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempTKMaterials2RQContracts: TKMaterials2RQContractsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


     TKMaterials2RQContractsFilterObj.codeorg := edtCodeorg.Text; 



     TKMaterials2RQContractsFilterObj.name := edtName.Text; 



     TKMaterials2RQContractsFilterObj.contractNumber := edtContractNumber.Text; 



     if edtcontractDate.checked then
     begin 
       if TKMaterials2RQContractsFilterObj.contractDate = nil then
          TKMaterials2RQContractsFilterObj.contractDate := TXSDate.Create;
       TKMaterials2RQContractsFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       TKMaterials2RQContractsFilterObj.contractDate := nil;

  end;
end;




end.