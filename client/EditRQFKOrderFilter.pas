
unit EditRQFKOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, RQFKOrderController;

type
  TfrmRQFKOrderFilterEdit = class(TDialogForm)


  lblRQFKOrderKindKindName : TLabel;


  HTTPRIORQFKOrder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcRQFKOrderFilter: TPageControl;
    tsMainParameters: TTabSheet;
    lblNumberDoc: TLabel;
    edtNumberDoc: TEdit;
    lblDateGen: TLabel;
    lblDateGenFrom: TLabel;
    edtDateGenFrom: TDateTimePicker;
    lblDateGenTo: TLabel;
    edtDateGenTo: TDateTimePicker;
    lblRQFKOrderStatusStatusName: TLabel;
    edtRQFKOrderStatusStatusName: TEdit;
    spbRQFKOrderStatusStatus: TSpeedButton;
    edtMolInName: TEdit;
    lblMolInName: TLabel;
    lblMolInCode: TLabel;
    edtMolInCode: TEdit;
    tsAdditionalParameters: TTabSheet;
    edtWarrantFIO: TEdit;
    lblWarrantFIO: TLabel;
    edtWarrantDate: TDateTimePicker;
    lblWarrantDate: TLabel;
    lblWarrantNumber: TLabel;
    edtWarrantNumber: TEdit;
    lblTKAccountingTypeName: TLabel;
    cbTKAccountingType: TComboBox;
    lblPalletNumber: TLabel;
    edtPalletNumber: TEdit;
    spbZoneClear: TSpeedButton;
    spbZone: TSpeedButton;
    lblZone: TLabel;
    edtZone: TEdit;
    edtDateDelivery: TDateTimePicker;
    lblDateDelivery: TLabel;
    chkAutoOrderCountersOnServicesObject: TCheckBox;
    cmbIsSentMaterials: TComboBox;
    chbIsSentMaterials: TCheckBox;
    edtSumWithoutNds: TEdit;
    lblSumWithoutNds: TLabel;
    edtDatePostingTo: TDateTimePicker;
    lblDatePostingTo: TLabel;
    edtDatePostingFrom: TDateTimePicker;
    lblDatePostingFrom: TLabel;
    lblDatePosting: TLabel;
    lblRQOrgOrgName: TLabel;
    edtRQOrgOrgName: TEdit;
    spbRQOrgOrg: TSpeedButton;
    spbRQOrgClear: TSpeedButton;
    edtExpeditorName: TEdit;
    lblExpeditorName: TLabel;
    edtExpeditorCode: TEdit;
    lblExpeditorCode: TLabel;
    lblMolOutName: TLabel;
    edtMolOutName: TEdit;
    edtMolOutCode: TEdit;
    lblMolOutCode: TLabel;
    spbContractNumberClear: TSpeedButton;
    spbContractNumber: TSpeedButton;
    edtContractNumber: TEdit;
    lblAgree: TLabel;
    lblOZNumber: TLabel;
    edtOZNumber: TEdit;
    lblCheckedByAccountant: TLabel;
    cmbCheckedByAccountant: TComboBox;
    edtCode: TEdit;
    Label1: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQFKOrderKindKindClick(Sender : TObject);
  procedure spbRQFKOrderStatusStatusClick(Sender : TObject);
  procedure spbRQOrgOrgClick(Sender : TObject);
    procedure spbRQOrgClearClick(Sender: TObject);
    procedure spbContractNumberClearClick(Sender: TObject);
    procedure spbContractNumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbZoneClearClick(Sender: TObject);
    procedure spbZoneClick(Sender: TObject);
    procedure chbIsSentMaterialsClick(Sender: TObject);

  private
    { Private declarations }

    contractNumber: String;
    contractDate: TDate;
    finDocCode: String;
    finDocID: Integer;
    zoneCode : Integer;
        
  public
    { Public declarations }

end;

var
  frmRQFKOrderFilterEdit: TfrmRQFKOrderFilterEdit;
  RQFKOrderFilterObj: RQFKOrderFilter;

implementation

uses
  ShowRQFKOrderKind
  , RQFKOrderKindController
  , ShowRQFKOrderStatus
  , RQFKOrderStatusController
  , ShowRQOrg
  , RQOrgController
  , ENConsts, ShowFINServicesObject, ENServicesObjectController
  , RQStorageZoneController, ShowRQStorageZone
  , TKAccountingTypeController, DMReportsUnit;

{uses  
    EnergyproController, EnergyproController2, RQFKOrderController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtRQFKOrderStatusStatusName, edtRQOrgOrgName, edtContractNumber, edtZone]);

  spbRQOrgClearClick(Sender);

  SetFloatStyle(edtSumWithoutNds);

  pcRQFKOrderFilter.ActivePage := tsMainParameters;

  edtNumberDoc.setFocus;

  if (RQFKOrderFilterObj.kind.code in [RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE]) then
  begin
    lblPalletNumber.Visible := False;
    edtPalletNumber.Visible := False;
    lblZone.Visible := False;
    edtZone.Visible := False;
    spbZone.Visible := False;
    spbZoneClear.Visible := False;

    lblTKAccountingTypeName.Visible := False;
    cbTKAccountingType.Visible := False;
  end;

  if (RQFKOrderFilterObj.kind.code <> RQFKORDER_KIND_RASHOD_OE2REM ) then
    chkAutoOrderCountersOnServicesObject.Visible:= false;


{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtDateGen
      ,edtMolOutCode
      ,edtMolOutName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberDoc.Text := RQFKOrderObj.numberDoc; 

      if RQFKOrderObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQFKOrderObj.dateGen.Year,RQFKOrderObj.dateGen.Month,RQFKOrderObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    edtMolOutCode.Text := RQFKOrderObj.molOutCode;
    edtMolOutName.Text := RQFKOrderObj.molOutName;
    edtMolInCode.Text := RQFKOrderObj.molInCode;
    edtMolInName.Text := RQFKOrderObj.molInName;
    edtExpeditorCode.Text := RQFKOrderObj.expeditorCode;
    edtExpeditorName.Text := RQFKOrderObj.expeditorName;
    edtWarrantNumber.Text := RQFKOrderObj.warrantNumber;

      if RQFKOrderObj.warrantDate <> nil then
      begin
        edtWarrantDate.DateTime:=EncodeDate(RQFKOrderObj.warrantDate.Year,RQFKOrderObj.warrantDate.Month,RQFKOrderObj.warrantDate.Day);
        edtWarrantDate.checked := true;
      end
      else
      begin
        edtWarrantDate.DateTime:=SysUtils.Date;
        edtWarrantDate.checked := false;
      end;

    edtWarrantFIO.Text := RQFKOrderObj.warrantFIO;

      if RQFKOrderObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQFKOrderObj.dateEdit.Year,RQFKOrderObj.dateEdit.Month,RQFKOrderObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtUserGen.Text := RQFKOrderObj.userGen;

  end;

}

end;



procedure TfrmRQFKOrderFilterEdit.chbIsSentMaterialsClick(Sender: TObject);
begin
  inherited;
  cmbIsSentMaterials.Visible := chbIsSentMaterials.Checked;
end;

procedure TfrmRQFKOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    condition: String;
begin
  if (ModalResult = mrOk)  then
  begin

     RQFKOrderFilterObj.numberDoc := edtNumberDoc.Text; 

     {
     if edtdateGen.checked then
     begin
       if RQFKOrderFilterObj.dateGen = nil then
          RQFKOrderFilterObj.dateGen := TXSDate.Create;
       RQFKOrderFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQFKOrderFilterObj.dateGen := nil;
     }

     condition := '';

     if edtDateGenFrom.Checked then
       AddCondition(condition, ' RQFKORDER.dategen >= to_date(''' + DateToStr(edtDateGenFrom.Date) + ''', ''dd.MM.yyyy'')');

     if edtDateGenTo.Checked then
       AddCondition(condition, ' RQFKORDER.dategen <= to_date(''' + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')');

     if edtDatePostingFrom.Checked then
       AddCondition(condition, ' RQFKORDER.dateposting >= to_date(''' + DateToStr(edtDatePostingFrom.Date) + ''', ''dd.MM.yyyy'')');

     if edtDatePostingTo.Checked then
       AddCondition(condition, ' RQFKORDER.dateposting <= to_date(''' + DateToStr(edtDatePostingTo.Date) + ''', ''dd.MM.yyyy'')');


     if Length(RQFKOrderFilterObj.conditionSQL) > 0 then
       AddCondition(condition, RQFKOrderFilterObj.conditionSQL);

     // бля:?(кие ОРГи ... если не налл - типа создан и выбран ...
     if (RQFKOrderFilterObj.org <> nil) then
     begin
        AddCondition(condition, 'rqfkorder.orgcode in (select q.code from rqorg q where q.id = '+ IntToStr(RQFKOrderFilterObj.org.id) +')');
     end;

     // договора ...
     if (edtContractNumber.Text <> '') then
     begin
         AddCondition(condition, 'rqfkorder.code in (select qq.fkorderrefcode from rqfkorderitem qq where qq.findocid = '+ IntToStr(finDocID) +')');
     end;

     // номер ОЗ - только в перемещениях ..
     if (edtOZNumber.Text <> '') then
     begin
       AddCondition(condition ,
       'rqfkorder.code in ( select si.fkorderrefcode from scinvoice si, scorder so ' +
       ' where si.code = so.invoicerefcode ' +
       ' and so.kindrefcode = 2 and si.kindrefcode = 2 ' +
       ' and so.numberdoc = ''' + edtOZNumber.Text + ''')'
       );
     end;

     // Место хранения
     if zoneCode <> LOW_INT then
     begin
           AddCondition(condition, 'exists (select fi.code from rqfkorderitem as fi where fi.fkorderrefcode = RQFKORDER.CODE and fi.zonerefcode = ' + IntToStr(zoneCode) + ')');
     end;

       // Автоматические ордера на перемещение счетчиков под услуги на сторону
     if chkAutoOrderCountersOnServicesObject.Checked = True then
     begin
           AddCondition(condition, 'rqfkorder.CODE in (  ' +
				   ' select fi.fkorderrefcode from enestimateitem ei , enplanwork pw  , rqfkorderitem2enstmttm fi2ei , rqfkorderitem fi '+
				   ' where ei.planrefcode = pw.code '+
					 '	and ei.code = fi2ei.estimateitemcode '+
           '             and fi2ei.fkorderitemrefcode = fi.code '+
           '             and pw.kindcode = '+ intToStr(ENConsts.ENPLANWORKKIND_CURRENT) +
					 '	and ei.accountingtyperefcode = ' + intTostr(ENConsts.TK_ACCOUNTINGTYPE_COUNTER) +
					 '	and ei.kindrefcode = + ' + intToStr(ENConsts.ENESTIMATEITEMKIND_MATERIALS) +
					 '	and ei.materialrefcode in ('+ IntToStr(ENConsts.TKMATERIALS_COUNTER_1FService)  +' , ' + IntToStr(ENConsts.TKMATERIALS_COUNTER_3FService) + ' ) ' +
				   ' )'
           );
     end;

     RQFKOrderFilterObj.conditionSQL := condition;
     RQFKOrderFilterObj.molOutCode := edtMolOutCode.Text;
     RQFKOrderFilterObj.molOutName := edtMolOutName.Text;
     RQFKOrderFilterObj.molInCode := edtMolInCode.Text;
     RQFKOrderFilterObj.molInName := edtMolInName.Text;
     RQFKOrderFilterObj.expeditorCode := edtExpeditorCode.Text;
     RQFKOrderFilterObj.expeditorName := edtExpeditorName.Text;
     RQFKOrderFilterObj.warrantNumber := edtWarrantNumber.Text;


     if edtwarrantDate.checked then
     begin 
       if RQFKOrderFilterObj.warrantDate = nil then
          RQFKOrderFilterObj.warrantDate := TXSDate.Create;
       RQFKOrderFilterObj.warrantDate.XSToNative(GetXSDate(edtwarrantDate.DateTime));
     end
     else
       RQFKOrderFilterObj.warrantDate := nil;

     if edtSumWithoutNds.Text <> '' then
     begin
       RQFKOrderFilterObj.sumWithoutNds := TXSDecimal.Create;
       RQFKOrderFilterObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text
     end
     else
       RQFKOrderFilterObj.sumWithoutNds := nil;

     RQFKOrderFilterObj.warrantFIO := edtWarrantFIO.Text;

    RQFKOrderFilterObj.palletNumber := edtPalletNumber.Text;

    if (cbTKAccountingType.ItemIndex > 0) then
    begin
      if RQFKOrderFilterObj.accountingTypeRef = nil then RQFKOrderFilterObj.accountingTypeRef := TKAccountingTypeRef.Create;
      RQFKOrderFilterObj.accountingTypeRef.code := cbTKAccountingType.ItemIndex;
    end;

    if edtdateDelivery.checked then
     begin
       if RQFKOrderFilterObj.dateDelivery = nil then
          RQFKOrderFilterObj.dateDelivery := TXSDate.Create;
       RQFKOrderFilterObj.dateDelivery.XSToNative(GetXSDate(edtdateDelivery.DateTime));
     end
     else
       RQFKOrderFilterObj.dateDelivery := nil;

     if chbIsSentMaterials.Checked then begin
          if cmbIsSentMaterials.ItemIndex = 0 then begin
            RQFKOrderFilterObj.isMaterialsSent := 1;
          end else begin
            if Length(RQFKOrderFilterObj.conditionSQL) > 0 then
              RQFKOrderFilterObj.conditionSQL := RQFKOrderFilterObj.conditionSQL + ' AND COALESCE(RQFKORDER.ISMATERIALSSENT, 0) = 0'
            else
              RQFKOrderFilterObj.conditionSQL := 'COALESCE(RQFKORDER.ISMATERIALSSENT, 0) = 0';
          end;
     end;

     // SUPP-70367
	 if cmbCheckedByAccountant.ItemIndex > -1 then begin
	     if cmbCheckedByAccountant.ItemIndex = 0 then begin
		     RQFKOrderFilterObj.checkedByAccountant := TXSBoolean.Create;
			 RQFKOrderFilterObj.checkedByAccountant.asBoolean := true;
		 end;
	     if cmbCheckedByAccountant.ItemIndex = 1 then begin
            if Length(RQFKOrderFilterObj.conditionSQL) > 0 then
              RQFKOrderFilterObj.conditionSQL := RQFKOrderFilterObj.conditionSQL + ' AND ';
            RQFKOrderFilterObj.conditionSQL := RQFKOrderFilterObj.conditionSQL + 'COALESCE(RQFKORDER.CHECKEDBYACCOUNTANT, false) = false';
		 end;
	 end;

   if (edtCode.Text <> '') then
       try
         RQFKOrderFilterObj.code := StrToInt(Trim(edtCode.Text));
       except on EConvertError do begin
           RQFKOrderFilterObj.code := LOW_INT;
        end
       end
   else
       RQFKOrderFilterObj.code := Low(Integer) ;

  end;
end;

procedure TfrmRQFKOrderFilterEdit.spbRQFKOrderKindKindClick(Sender : TObject);
var
   frmRQFKOrderKindShow: TfrmRQFKOrderKindShow;
begin
   frmRQFKOrderKindShow:=TfrmRQFKOrderKindShow.Create(Application,fmNormal);
   try
      with frmRQFKOrderKindShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderFilterObj.kind = nil then RQFKOrderFilterObj.kind := RQFKOrderKind.Create();
               RQFKOrderFilterObj.kind.code := StrToInt(GetReturnValue(sgRQFKOrderKind,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQFKOrderKindShow.Free;
   end;
end;


procedure TfrmRQFKOrderFilterEdit.spbRQFKOrderStatusStatusClick(Sender : TObject);
var 
   frmRQFKOrderStatusShow: TfrmRQFKOrderStatusShow;
begin
   frmRQFKOrderStatusShow:=TfrmRQFKOrderStatusShow.Create(Application,fmNormal);
   try
      with frmRQFKOrderStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderFilterObj.status = nil then RQFKOrderFilterObj.status := RQFKOrderStatus.Create();
               RQFKOrderFilterObj.status.code := StrToInt(GetReturnValue(sgRQFKOrderStatus,0));
               edtRQFKOrderStatusStatusName.Text:=GetReturnValue(sgRQFKOrderStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQFKOrderStatusShow.Free;
   end;
end;


procedure TfrmRQFKOrderFilterEdit.spbRQOrgOrgClick(Sender : TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
   tmpOrg: RQOrg;
begin
(*
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
              { бля№%;кие ОРГИ ;))  }
               if RQFKOrderFilterObj.org = nil then RQFKOrderFilterObj.org := RQOrg.Create();
               // фильтр по коду ищет в ДАО ....
               // RQFKOrderFilterObj.org.code := StrToInt(GetReturnValue(sgRQOrg,0));
               RQFKOrderFilterObj.org.code := LOW_INT;
               RQFKOrderFilterObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0));
               
               edtRQOrgOrgName.Text:=GetReturnValue(sgRQOrg,1);

               spbContractNumberClearClick(Sender);
               DisableControls([spbContractNumber], false);
                              
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
*)

  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, RQFKOrderFilterObj.org) then
  begin
    RQFKOrderFilterObj.org := tmpOrg;
    edtRQOrgOrgName.Text := RQFKOrderFilterObj.org.name;
    spbContractNumberClearClick(Sender);
    DisableControls([spbContractNumber], false);
  end;
end;





procedure TfrmRQFKOrderFilterEdit.spbRQOrgClearClick(Sender: TObject);
begin
  inherited;
  edtRQOrgOrgName.Text := '';
  spbContractNumberClearClick(Sender);
  DisableControls([spbContractNumber]);
end;

procedure TfrmRQFKOrderFilterEdit.spbContractNumberClearClick(
  Sender: TObject);
begin
  inherited;
  contractNumber := '';
  finDocCode := '';
  finDocID := LOW_INT;
  edtContractNumber.Text := '';
  // 14.01.2011 Пока задисейблим edtContractNumber
  //*** DisableControls([edtContractNumber], false);
  //DenyBlankValues([edtContractNumber]);
  //DisableControls([edtContractNumber]);
end;

procedure TfrmRQFKOrderFilterEdit.spbContractNumberClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin

   if ( RQFKOrderFilterObj.org = nil) then
   begin
      DisableControls([spbContractNumber]);
      Exit;
   end;

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(RQFKOrderFilterObj.org.id) ; // and a.agree_group_id in (205, 342, 319, 88)';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      //frmFINServicesObjectShow.
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                contractNumber := GetReturnValue(sgFINServicesObject, 1);
                contractDate := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                finDocCode := GetReturnValue(sgFINServicesObject, 5);
                finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));
                DisableControls([edtContractNumber]);
                //DenyBlankValues([edtContractNumber]);
                edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmRQFKOrderFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  zoneCode := LOW_INT;
end;

procedure TfrmRQFKOrderFilterEdit.spbZoneClearClick(Sender: TObject);
begin
  inherited;
  zoneCode := LOW_INT;
  edtZone.Text := '';
end;

procedure TfrmRQFKOrderFilterEdit.spbZoneClick(Sender: TObject);
var zoneFilter: RQStorageZoneFilter;
    frmRQStorageZoneShow: TfrmRQStorageZoneShow;
begin

  zoneFilter := RQStorageZoneFilter.Create;
  SetNullIntProps(zoneFilter);
  SetNullXSProps(zoneFilter);

  zoneFilter.orderBySQL := 'rqstoragezone.name';

  frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
  try
    frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                         frmRQStorageZoneShow.actDelete,
                                         frmRQStorageZoneShow.actEdit]);
    with frmRQStorageZoneShow do
      if ShowModal = mrOk then
      begin
        try
          zoneCode := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          edtZone.Text := GetReturnValue(sgRQStorageZone, 2);
        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;
end;


end.
