
unit EditTKMaterials2RQContracts;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, TKMaterials2RQContractsController ;

type
  TfrmTKMaterials2RQContractsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCodeorg : TLabel;
    edtCodeorg: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblContractNumber : TLabel;
    edtContractNumber: TEdit;


  HTTPRIOTKMaterials2RQContracts: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbTKMaterials: TSpeedButton;
    edtTKMaterials: TEdit;
    lblTKMaterials: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;
    spbCodeorg: TSpeedButton;
    spbContract: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKMaterialsClick(Sender: TObject);
    procedure spbCodeorgClick(Sender: TObject);
    procedure spbContractClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmTKMaterials2RQContractsEdit: TfrmTKMaterials2RQContractsEdit;
  TKMaterials2RQContractsObj: TKMaterials2RQContracts;

implementation


{uses
    EnergyproController, EnergyproController2, TKMaterials2RQContractsController  ;
}
uses TKMaterialsController, ShowTKMaterials, ShowRQOrg, ShowFINServicesObject
, ENServicesObjectController, ENConsts;
{$R *.dfm}



procedure TfrmTKMaterials2RQContractsEdit.FormShow(Sender: TObject);
var
  TempMaterials : TKMaterialsControllerSoapPort;
  TKMaterialsObj : TKMaterials;
begin

  DisableControls([edtCode, edtTKMaterials, edtCodeorg, edtName, edtContractNumber]);

  if DialogState = dsView then
  begin
    DisableControls([spbTKMaterials, spbCodeorg, spbContract]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtTKMaterials
      ,edtCodeorg
      ,edtName
      ,edtContractNumber
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(TKMaterials2RQContractsObj.code);

    edtCodeorg.Text := TKMaterials2RQContractsObj.codeorg;
    edtName.Text := TKMaterials2RQContractsObj.name;
    edtContractNumber.Text := TKMaterials2RQContractsObj.contractNumber + ' від ' + DateToStr(TKMaterials2RQContractsObj.contractDate.AsDate);


  {Вытянем имя материала и занесем его в текстовое поле}
   TempMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
   TKMaterialsObj := TempMaterials.getObject(TKMaterials2RQContractsObj.materialRef.code);

   if TKMaterialsObj <> nil then
      edtTKMaterials.Text := TKMaterialsObj.name
   else
      edtTKMaterials.Text := '';


  end;
end;



procedure TfrmTKMaterials2RQContractsEdit.spbCodeorgClick(Sender: TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
begin
  inherited;
	 frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
                 TKMaterials2RQContractsObj.org_id := StrToInt(GetReturnValue(sgRQOrg,0));
                 TKMaterials2RQContractsObj.codeorg := GetReturnValue(sgRQOrg,8);
                 TKMaterials2RQContractsObj.name := GetReturnValue(sgRQOrg,1);
                 edtCodeorg.Text := TKMaterials2RQContractsObj.codeorg;
                 edtName.Text := TKMaterials2RQContractsObj.name;

                 edtContractNumber.Text := '';
                TKMaterials2RQContractsObj.contractNumber := '';
                TKMaterials2RQContractsObj.contractDate := nil;
                TKMaterials2RQContractsObj.finDocCode := '';
                TKMaterials2RQContractsObj.finDocID := LOW_INT;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;

procedure TfrmTKMaterials2RQContractsEdit.spbContractClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
  inherited;
  f := ENServicesObjectFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);
  if TKMaterials2RQContractsObj.org_id = Low(Integer) then
  begin
         Application.MessageBox(PChar('Оберіть постачальника!'),
                         PChar('Увага!'), MB_ICONINFORMATION);
         Exit;
  end;


   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(TKMaterials2RQContractsObj.org_id) ; // and a.agree_group_id in (205, 342, 319, 88)';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
                TKMaterials2RQContractsObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
                if TKMaterials2RQContractsObj.contractDate = nil then TKMaterials2RQContractsObj.contractDate := TXSDate.Create();

                TKMaterials2RQContractsObj.contractDate.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgFINServicesObject, 2))));
                TKMaterials2RQContractsObj.finDocCode := GetReturnValue(sgFINServicesObject, 5);
                TKMaterials2RQContractsObj.finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));

                if TKMaterials2RQContractsObj.finDocID = LOW_INT then
                  raise Exception.Create('Помилка при виборі договору!');

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmTKMaterials2RQContractsEdit.spbTKMaterialsClick(Sender: TObject);
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
               if TKMaterials2RQContractsObj.materialRef = nil then TKMaterials2RQContractsObj.materialRef := TKMaterialsRef.Create();
               TKMaterials2RQContractsObj.materialRef.code:=  TKMaterialsShort(tvDep.Selected.Data).code;
               edtTKMaterials.Text:= TKMaterialsShort(tvDep.Selected.Data).name;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMAterialsShow.Free;
   end;
end;


procedure TfrmTKMaterials2RQContractsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempTKMaterials2RQContracts: TKMaterials2RQContractsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtTKMaterials
      ,edtCodeorg
      ,edtName
      ,edtContractNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempTKMaterials2RQContracts := HTTPRIOTKMaterials2RQContracts as TKMaterials2RQContractsControllerSoapPort;

     TKMaterials2RQContractsObj.codeorg := edtCodeorg.Text;

     TKMaterials2RQContractsObj.name := edtName.Text;

     TKMaterials2RQContractsObj.contractNumber := edtContractNumber.Text;

     if TKMaterials2RQContractsObj.org_id = LOW_INT then raise Exception.Create('Не обрана організація');
     if TKMaterials2RQContractsObj.finDocID = LOW_INT then raise Exception.Create('Не обраний договір');
     if (TKMaterials2RQContractsObj.materialRef = nil) or (TKMaterials2RQContractsObj.materialRef.code = LOW_INT) then raise Exception.Create('Не обраний матеріал');


    if DialogState = dsInsert then
    begin
      TKMaterials2RQContractsObj.code:=low(Integer);
      TempTKMaterials2RQContracts.add(TKMaterials2RQContractsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempTKMaterials2RQContracts.save(TKMaterials2RQContractsObj);
    end;
  end;
end;


end.