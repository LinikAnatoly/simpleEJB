unit reportTenderMaterials;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, Buttons , DialogFormUnit , ChildFormUnit , RQOrgController , XSBuiltIns,
  InvokeRegistry, Rio, SOAPHTTPClient, ComCtrls;

type
	TfrmreportTenderMaterials = class(TDialogForm)
		btnOk: TBitBtn;
		btnCancel: TBitBtn;
		lblRQOrgOrgName: TLabel;
		edtRQOrgOrgName: TEdit;
		spbRQOrg: TSpeedButton;
		spbRQOrgClear: TSpeedButton;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    spbContractNumber: TSpeedButton;
    spbContractNumberClear: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    spbMaterialName: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    lblMeasurement: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblDeliveryDate: TLabel;
    edtMaterialName: TEdit;
    HTTPRIOENContract: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    grp1: TGroupBox;
    lblDateGen: TLabel;
    edtDateGenStart: TDateTimePicker;
    Label2: TLabel;
    edtDateGenFinal: TDateTimePicker;
    grp2: TGroupBox;
    chkbillStatusDraft: TCheckBox;
    chkbillStatusCompiled: TCheckBox;
    chkbillStatusApproved: TCheckBox;
		procedure spbRQOrgClick(Sender: TObject);
    procedure spbContractNumberClick(Sender: TObject);
    procedure spbContractNumberClearClick(Sender: TObject);
    procedure spbRQOrgClearClick(Sender: TObject);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
	private
		{ Private declarations }
		org: RQOrg;
		materialCode: Integer;
    departmentCode: Integer;
    elementCode: Integer;
    budgetCode: Integer;

    materialInContractCode: Integer;

		contractNumber: String;
		contractDate: TDate;
		finDocCode: String;
		finDocID: Integer;

		planCodes: String;

		
		orderCode: Integer;
	public
		{ Public declarations }
	end;

var
	frmreportTenderMaterials: TfrmreportTenderMaterials;

implementation

uses
	ShowRQOrg , ShowFINServicesObject, ENServicesObjectController,
  ShowENContractItem, ENConsts , ENContractController , ENContractItemController, 
  TKMaterialsController , EnergyproController , DMReportsUnit;

{$R *.dfm}

procedure TfrmreportTenderMaterials.spbRQOrgClick(Sender: TObject);
var
	 frmRQOrgShow: TfrmRQOrgShow;
	 TempRQOrg: RQOrgControllerSoapPort;
	 sDate, lDate, nDate: String;
   tmpOrg: RQOrg;
begin
{
	 frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
	 try
			with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if org = nil then
               begin
                org := RQOrg.Create();
                SetNullIntProps(org);
                SetNullXSProps(org);
               end;
               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               org.codeorg := GetReturnValue(sgRQOrg,8);
               org.name := GetReturnValue(sgRQOrg,1);
               org.ukr_name := GetReturnValue(sgRQOrg,9);
               org.okpo := GetReturnValue(sgRQOrg,2);
               org.nalog_num := GetReturnValue(sgRQOrg,3);
               org.svidet_num := GetReturnValue(sgRQOrg,4);
               org.adr := GetReturnValue(sgRQOrg,5);
               org.tel := GetReturnValue(sgRQOrg,6);
               org.country := GetReturnValue(sgRQOrg,10);
               org.region := GetReturnValue(sgRQOrg,11);
               org.ministry := GetReturnValue(sgRQOrg,12);
               org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               org.type_ := GetReturnValue(sgRQOrg,14);
               org.master_code := GetReturnValue(sgRQOrg,15);

               //org.date_svidet := TXSDate.Create;
               //org.likv_date := TXSDate.Create;
               //org.dateNalogform := TXSDate.Create;

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    org.date_svidet := TXSDate.Create;
                    org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end
                   else
                     org.date_svidet := nil;

               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    org.likv_date := TXSDate.Create;
                    org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end
                   else
                     org.likv_date := nil;

               org.except_flag := GetReturnValue(sgRQOrg,18);
               org.likv_flag := GetReturnValue(sgRQOrg,19);
               org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    org.date_nalogform := TXSDate.Create;
                    org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end
                   else
                     org.date_nalogform := nil;

               org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               org.adr_legal := GetReturnValue(sgRQOrg,23);
               org.Primechan := GetReturnValue(sgRQOrg,7);

               spbContractNumberClearClick(Sender);
               DisableControls([spbContractNumber], false);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
	 end;
}
  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, org) then
  begin
    org := tmpOrg;
    edtRQOrgOrgName.Text := org.name;
    spbContractNumberClearClick(Sender);
    DisableControls([spbContractNumber], false);
  end;
end;

procedure TfrmreportTenderMaterials.spbContractNumberClick(
  Sender: TObject);
var
	 frmFINServicesObjectShow: TfrmFINServicesObjectShow;
	 f : ENServicesObjectFilter;
begin
	 f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
	 SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   if org = nil then
    f.conditionSQL := ' a.io_flag = ''B'' '
   else
    f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(org.id) ; // and a.agree_group_id in (205, 342, 319, 88)';

    f.isActive := 1; // что бы выбирать так же закрытые договора тут

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
								DenyBlankValues([edtContractNumber]);
                edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);

								///// 30.01.13 Очистим поле "Материал"
								// Автоматически выдергиваем непривязанный остаток по договору и выбранному материалу
								// getRestCountByContract(finDocCode, materialCode);
								spbMaterialClearClick(Sender);
                /////
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmreportTenderMaterials.spbContractNumberClearClick(
  Sender: TObject);
begin
	contractNumber := '';
	finDocCode := '';
	finDocID := LOW_INT;
	edtContractNumber.Text := '';
  // 14.01.2011 Пока задисейблим edtContractNumber
  //*** DisableControls([edtContractNumber], false);
  DenyBlankValues([edtContractNumber]);

  // 30.01.13 Очистим поле "Материал"
  spbMaterialClearClick(Sender);
end;

procedure TfrmreportTenderMaterials.spbRQOrgClearClick(Sender: TObject);
begin
  edtRQOrgOrgName.Text := '';
  org := nil;
  spbContractNumberClearClick(Sender);
  DisableControls([spbContractNumber]);
end;

procedure TfrmreportTenderMaterials.spbMaterialNameClick(Sender: TObject);
var
   frmENContractItemShow: TfrmENContractItemShow;

   TempENContract: ENContractControllerSoapPort;
   contractFilter: ENContractFilter;
   contractList: ENContractShortList;

   contractItemFilter: ENContractItemFilter;

   TempTKMaterials: TKMaterialsControllerSoapPort;
   materialFilter: TKMaterialsFilter;
   materialList: TKMaterialsShortList;
begin
  if (finDocCode = '') or (finDocID = LOW_INT) or (org = nil) then
  begin
    Application.MessageBox(PChar('Оберіть договір!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;

  contractItemFilter := ENContractItemFilter.Create();
  SetNullXSProps(contractItemFilter);
  SetNullIntProps(contractItemFilter);

  /////
  contractItemFilter.contract := ENContract.Create;

  contractFilter := ENContractFilter.Create;
  SetNullIntProps(contractFilter);
  SetNullXSProps(contractFilter);
  contractFilter.finDocCode := finDocCode;
  contractFilter.finDocID := finDocID;

  TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
  contractList := TempENContract.getScrollableFilteredList(contractFilter, 0, 1);
  if High(contractList.list) > -1 then
    contractItemFilter.contract.code := contractList.list[0].code
  else
    contractItemFilter.contract.code := -1; // чтобы ничего не выбралось
  /////

  frmENContractItemShow := TfrmENContractItemShow.Create(Application, fmNormal, contractItemFilter);
  try
    if High(contractList.list) > -1 then
    begin
      frmENContractItemShow.contractCode := contractList.list[0].code;
    end
    else begin
      /// Организация //////////////////////////////////////////////////////////
      {
      if frmENContractItemShow.org = nil then
      begin
        frmENContractItemShow.org := RQOrg.Create();
        SetNullIntProps(frmENContractItemShow.org);
        SetNullXSProps(frmENContractItemShow.org);
      end;
      frmENContractItemShow.org.id := org.id; // по ИД будем смотреть на серваке ...
      frmENContractItemShow.org.codeorg := org.codeorg;
      frmENContractItemShow.org.name := org.name;
      frmENContractItemShow.org.ukr_name := org.ukr_name;
      frmENContractItemShow.org.okpo := org.okpo;
      frmENContractItemShow.org.nalog_num := org.nalog_num;
      frmENContractItemShow.org.svidet_num := org.svidet_num;
      frmENContractItemShow.org.adr := org.adr;
      frmENContractItemShow.org.tel := org.tel;
      frmENContractItemShow.org.country := org.country;
      frmENContractItemShow.org.region := org.region;
      frmENContractItemShow.org.ministry := org.ministry;
      frmENContractItemShow.org.ownership := org.ownership;
      frmENContractItemShow.org.type_ := org.type_;
      frmENContractItemShow.org.master_code := org.master_code;

      //frmENContractItemShow.org.date_svidet := TXSDate.Create;
      //frmENContractItemShow.org.likv_date := TXSDate.Create;
      //frmENContractItemShow.org.dateNalogform := TXSDate.Create;

      if org.date_svidet <> nil then
      begin
        frmENContractItemShow.org.date_svidet := TXSDate.Create;
        frmENContractItemShow.org.date_svidet.XSToNative(org.date_svidet.NativeToXS);
      end;

      if org.likv_date <> nil then
      begin
        frmENContractItemShow.org.likv_date := TXSDate.Create;
        frmENContractItemShow.org.likv_date.XSToNative(org.likv_date.NativeToXS);
      end;

      if org.date_nalogform <> nil then
      begin
        frmENContractItemShow.org.date_nalogform := TXSDate.Create;
        frmENContractItemShow.org.date_nalogform.XSToNative(org.date_nalogform.NativeToXS);
      end;      

      frmENContractItemShow.org.except_flag := org.except_flag;
      frmENContractItemShow.org.likv_flag := org.likv_flag;
      frmENContractItemShow.org.budget_flag := org.budget_flag;

      frmENContractItemShow.org.id_nalogform := org.id_nalogform;
      frmENContractItemShow.org.adr_legal := org.adr_legal;
      frmENContractItemShow.org.Primechan := org.Primechan;
      }
      frmENContractItemShow.org := DMReports.copyOrg(org, frmENContractItemShow.org);
      //////////////////////////////////////////////////////////////////////////

      /// Договор //////////////////////////////////////////////////////////////
      frmENContractItemShow.contractNumber := contractNumber;
      frmENContractItemShow.contractDate := StrToDate(DateToStr(contractDate));
      frmENContractItemShow.finDocCode := finDocCode;
      frmENContractItemShow.finDocID := finDocID;
      //////////////////////////////////////////////////////////////////////////
    end;

    frmENContractItemShow.contractDescription := edtContractNumber.Text;

    frmENContractItemShow.DisableActions([frmENContractItemShow.actInsert, frmENContractItemShow.actDelete, frmENContractItemShow.actEdit]);
    materialCode := LOW_INT;

    with frmENContractItemShow do
      if ShowModal = mrOk then
      begin
        Self.materialCode := Integer(frmENContractItemShow.sgENContractItem.Objects[1, frmENContractItemShow.sgENContractItem.Row]);
        //ShowMessage(IntToStr(materialCode));

        edtMaterialName.Text := GetReturnValue(sgENContractItem, 1);

        //lblMeasurement.Caption := {'од.виміру : '+ }TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
        //lblDeliveryDate.Caption := {'строк постачання : '+ } IntToStr(TKMaterialsShort(tvDep.Selected.Data).deliveryDate){ + ' днів'}; //GetReturnValue(sgSpr_matherial, 2);

        if Self.materialCode <= 0 then
          raise Exception.Create('Не обрано матеріал!');

        materialFilter := TKMaterialsFilter.Create;
        SetNullIntProps(materialFilter);
        SetNullXSProps(materialFilter);
        materialFilter.code := Self.materialCode;

				TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        materialList := TempTKMaterials.getScrollableFilteredList(materialFilter, 0, -1);

        if materialList.totalCount > 0 then
        begin
          lblMeasurement.Caption := materialList.list[0].measurementName;
					lblDeliveryDate.Caption := IntToStr(materialList.list[0].deliveryDate);
        end;

				
      end;

  finally
    frmENContractItemShow.Free;
  end;

	end;
procedure TfrmreportTenderMaterials.spbMaterialClearClick(Sender: TObject);
begin
  edtMaterialName.Text := '';
	lblMeasurement.Caption := '';
	lblDeliveryDate.Caption := '';
	materialCode := LOW_INT;

end;

procedure TfrmreportTenderMaterials.btnOkClick(Sender: TObject);
var
	billCondition : string;

  argNames, args: ArrayOfString;
	reportName , statusStr: String;


begin

      SetLength(argNames, 6);
      SetLength(args, 6);

			if ((edtdateGenFinal.checked = False) and (edtDateGenStart.Checked = False) ) then
			 begin
				Application.MessageBox(PChar('Необхідно обрати період рахунків !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
				ModalResult := mrNone;
				Exit;
			 end;

			if ((chkbillStatusDraft.Checked = false) and (chkbillStatusCompiled.Checked = False) and (chkbillStatusApproved.Checked = False) ) then
			begin
				Application.MessageBox(PChar('Необхідно обрати статус рахунків !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
				ModalResult := mrNone;
				Exit;
			 end;


		 if edtdateGenStart.checked then
		 begin
			 AddCondition(billCondition, ' rqbill.dategen >= to_date(''' + DateToStr(edtDateGenStart.Date) + ''', ''dd.MM.yyyy'')');
		 end;

		 if edtdateGenFinal.checked then
		 begin
			 AddCondition(billCondition, ' rqbill.dategen <= to_date(''' + DateToStr(edtDateGenFinal.Date) + ''', ''dd.MM.yyyy'')');
		 end;


		 statusStr:= '';
		 if chkbillStatusDraft.Checked = True then
				statusStr := '1';

			if chkbillStatusCompiled.Checked = True then
				 if statusStr = '' then
						statusStr := '2'
				 else
						statusStr := statusStr + ',2';
						
			if chkbillStatusApproved.Checked = True then
				 if statusStr = '' then
						statusStr := '3'
				 else
						statusStr := statusStr + ',3';

			 if statusStr <> '' then
				AddCondition(billCondition, ' rqbill.statusrefcode in ( ' + statusStr + ')' );

		 argNames[0] := 'billCondition';
		 args[0]:=   billCondition;

		 argNames[1] := 'orgid';
			 if org <> nil then
						args[1]:=   IntToStr(org.id)
			else
					args[1]:=   '0';


			argNames[2] := 'findocid';
			 if finDocID <> LOW_INT then
					args[2]:=   IntToStr(finDocID)
			else
					args[2]:=   '0';


			argNames[3] := 'materialCode';
			 if materialCode <> LOW_INT then
			args[3]:=   IntToStr(materialCode)
			else
			args[3]:=   '0';

			reportName := 'Tender/tender_materials';
			makeReport(reportName, argNames, args, 'xls');

		 
end;

procedure TfrmreportTenderMaterials.FormCreate(Sender: TObject);
begin
		finDocID := LOW_INT;
end;

procedure TfrmreportTenderMaterials.FormShow(Sender: TObject);
begin
		 chkbillStatusDraft.Checked := True;
		 chkbillStatusCompiled.Checked := True;
		 chkbillStatusApproved.Checked := True;
end;

end.
