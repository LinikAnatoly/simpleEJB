unit reportCategoryWorkTKposition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmCategoryWorkTKposition = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    GroupBox2: TGroupBox;
    rbYear: TRadioButton;
    rbTekush: TRadioButton;
    spbEPKard: TSpeedButton;
    edtKartiName: TEdit;
    lblKarta: TLabel;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    edtKartiNum: TEdit;
    HTTPRIOTKTechCardPWI: THTTPRIO;
    lblYearRaznar: TLabel;
    lblMonthRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    Label1: TLabel;
    dtpEndDate: TDateTimePicker;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    spbFINExetutorClear: TSpeedButton;
    HTTPRIOFINExecutor: THTTPRIO;
    chbChildFinExecutor: TCheckBox;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbrenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbEPKardClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbFINExetutorClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure toggleChbChildFinExecutor;
  private
    { Private declarations }
	public
		{ Public declarations }
		renCode: Integer;
		renName: String;
		elementCode: Integer;
		elementName: String;
		budgetCode: Integer;
		budgetName: String;

		renCode2: Integer;
		renName2: String;
    vid_report : Integer;
    techcardcode : Integer;

    finExecutor_name : String;
    finExecutor_finCode : String;
    finExecutor_axCode : String;

    wasSetAxapta : Boolean;

  end;

var
  frmCategoryWorkTKposition: TfrmCategoryWorkTKposition;

implementation

{$R *.dfm}
uses ShowENDepartment , ENDepartmentTypeController , ENDepartmentController , ChildFormUnit , ENConsts
     , ShowENElement, ENElementController , EnergyproController , ShowENEPRen,
  ENElementTypeController, DMReportsUnit, ShowTKTechCard, TKTechCardController, ShowFINExecutorTree, FINExecutorController ,
  XSBuiltIns ;

procedure TfrmCategoryWorkTKposition.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);


   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
        DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            {try
               if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;}
          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmCategoryWorkTKposition.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
   TempFINExecutor : FINExecutorControllerSoapPort;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
    TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               finExecutor_name := DMReports.getFullExecutorName(tvDep.Selected);
               finExecutor_name := FINExecutorShort(tvDep.Selected.Data).name;
               if FINExecutorShort(tvDep.Selected.Data).finCode <> LOW_INT then
               finExecutor_finCode := IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode);

               finExecutor_axCode := FINExecutorShort(tvDep.Selected.Data).axOrgId;
               toggleChbChildFinExecutor;
               if( (finExecutor_finCode = '')  and ( finExecutor_axCode <> '' )  )
               then
               begin
                wasSetAxapta := true;
                finExecutor_finCode := TempFINExecutor.getpodrFinCodeBypodrAxCodeFromFinexecutor(finExecutor_axCode);
               end;

               edtFINExecutorName.Text := finExecutor_name ;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmCategoryWorkTKposition.spbFINExetutorClearClick(Sender: TObject);
begin
   edtFINExecutorName.Text := '';
   finExecutor_finCode:= '';
   finExecutor_axCode := '';
   toggleChbChildFinExecutor;
end;

procedure TfrmCategoryWorkTKposition.spbEPKardClick(Sender: TObject);
var
   frmKartiShow: TfrmTKTechCardShow;
   TempTKTechCard: TKTechCardControllerSoapPort;
   tcObj: TKTechCard;
begin
   frmKartiShow:=TfrmTKTechCardShow.Create(Application,fmNormal);


   try
      with frmKartiShow do
      begin
        // NET-73 Закрываем любое редактирование техкарт (оставляем только просмотр)
        // (для редактирования есть отдельный клиент!)
        DisableActions([frmKartiShow.actInsert, frmKartiShow.actEdit, frmKartiShow.actDelete]);

        if ShowModal = mrOk then
        begin
            try
               TempTKTechCard := HTTPRIOTKTechCardPWI as TKTechCardControllerSoapPort;
               tcObj := TempTKTechCard.getObject(StrToInt(GetReturnValue(sgTKTechCard,0)));

               edtKartiName.Text := tcObj.name; //GetReturnValue(sgTKTechCard,2);
               edtKartiNum.Text := tcObj.techKartNumber; //GetReturnValue(sgTKTechCard,1);
               techcardcode := tcObj.code;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmKartiShow.Free;
   end;
end;

procedure TfrmCategoryWorkTKposition.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';

end;

procedure TfrmCategoryWorkTKposition.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmCategoryWorkTKposition.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
end;

procedure TfrmCategoryWorkTKposition.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.orderBySQL := 'typerefcode';

  if renCode > 0 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := renCode;
  end;
  // А для ХОЭ (renCode = 0) выбираем все объекты

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
    frmENElementShow.isFiltered := true;
    with frmENElementShow do
      if ShowModal = mrOk then
			begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          elementName := GetReturnValue(sgENElement,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmCategoryWorkTKposition.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
end;

procedure TfrmCategoryWorkTKposition.spbrenClick(Sender: TObject);
var
	 frmEPRenShow: TfrmENEPRenShow;
begin
	 frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try

							 renCode2 := StrToInt(GetReturnValue(sgEPRen,0));
							 renName2 := GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

procedure TfrmCategoryWorkTKposition.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
  reportName: String;

  strFinExecutorCodes : string;
  strFinExecutorAxCodes : string;
  isMDAX : TXSBoolean;
  finExecutor : String;
begin


    begin
     SetLength(argNames, 9);
     SetLength(args, 9);

     argNames[0] := 'renCode';
     args[0] := IntToStr(renCode);

     argNames[1] := 'datestart';
     args[1] := DateToStr(dtpStartDate.DateTime);

     argNames[2] := 'datefinal';
     args[2] := DateToStr(dtpEndDate.DateTime);

     argNames[3] := 'pKindCode';
     if rbYear.Checked then
     args[3] := IntToStr(ENConsts.ENPLANWORKKIND_YEAR)
     else
     args[3] := IntToStr(ENConsts.ENPLANWORKKIND_CURRENT);

     argNames[4] := 'renName';
     if renCode = 0 then
      args[4] := 'ХОЕ'
     else
      args[4] := renName;

     argNames[5] :='techcardcode';
     args[5] := IntToStr(techcardcode);

     if chbChildFinExecutor.Checked then begin

          isMDAX := TXSBoolean.Create;
          isMDAX.AsBoolean := false;
          if wasSetAxapta then begin
            strFinExecutorCodes := finExecutor_finCode;
          end else begin
            strFinExecutorCodes := DMReports.getStrAllFINExecutorIdsByParent(finExecutor_finCode, isMDAX);
          end;
          isMDAX := TXSBoolean.Create;
          isMDAX.AsBoolean := true;

          strFinExecutorAxCodes := DMReports.getStrAllFINExecutorIdsByParent(finExecutor_axCode, isMDAX);
       end else begin
          strFinExecutorCodes := finExecutor_finCode;
            if length(finExecutor_axCode)>0 then
               strFinExecutorAxCodes := chr(39) + finExecutor_axCode + chr(39);
       end;

       if length(strFinExecutorCodes)=0 then
          strFinExecutorCodes:= '0';

       if length(strFinExecutorAxCodes)=0 then
          strFinExecutorAxCodes:= chr(39) + '0' + chr(39);

     argNames[6] := 'finExecutor_finCode';
     args[6]:= strFinExecutorCodes;

     argNames[7] := 'finExecutor_axCode';
     args[7]:= strFinExecutorAxCodes;


     argNames[8] := 'finExecutorName';
     if length(edtFINExecutorName.Text)>0 then
     args[8]:= edtFINExecutorName.Text
     else
     args[8]:= '';




     if vid_report = 1 then
       reportName := 'Personal/categoryWorkTKposition'
     else
       reportName := 'Personal/categoryWorkTKtechcard';

     makeReport(reportName , argNames , args , 'xls');

   end;

end;

procedure TfrmCategoryWorkTKposition.FormCreate(Sender: TObject);
begin
  inherited;
   finExecutor_finCode := '';
   finExecutor_name:= '';
   finExecutor_axCode := '';
   wasSetAxapta := false;
end;

procedure TfrmCategoryWorkTKposition.FormShow(Sender: TObject);
var
 f : ENElementTypeFilter;
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 i  , idx : integer;
begin


	 renName:='';
   renCode:=0;

   DisableControls([edtKartiName, edtKartiNum]);
   techcardcode:= 0;

   if vid_report = 2 then
   HideControls([lblKarta , edtKartiNum ,  edtKartiName , spbEPKard ],false);

   
end;

procedure TfrmCategoryWorkTKposition.toggleChbChildFinExecutor;
begin
  if (DMReports.UsesMDAXData) then begin
  {haha}
    {  finExecutor_finCode : String;
    finExecutor_axCode : String;}
    if (Length(finExecutor_axCode) > 0) then begin
        chbChildFinExecutor.Visible := True;
        chbChildFinExecutor.Checked := False;
    end else begin
        chbChildFinExecutor.Visible := False;
        chbChildFinExecutor.Checked := False;
    end;

  end else begin
    if (Length(finExecutor_finCode) > 0) then begin
        chbChildFinExecutor.Visible := True;
        chbChildFinExecutor.Checked := False;
    end else begin
        chbChildFinExecutor.Visible := False;
        chbChildFinExecutor.Checked := False;
    end;
  end;
end;

end.
