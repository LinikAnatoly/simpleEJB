unit AddWorkItemByShifr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, ExtCtrls,ENConsts ,TKClType2CodeProjectController,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmAddWorkItemByShifr = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    grpMakeCodeShifr: TGroupBox;
    rgVOLTAGE: TRadioGroup;
    rbVOLTAGE220: TRadioButton;
    rbVOLTAGE380: TRadioButton;
    gbNOMINALVALUE: TGroupBox;
    cbbNOMINALVALUE: TComboBox;
    gbUSEPILLAR: TGroupBox;
    rbwithoutUSEPILLAR: TRadioButton;
    rbwithUSEPILLAR: TRadioButton;
    gbTYPEZKOE: TGroupBox;
    rbTYPEZKOE_0: TRadioButton;
    rbTYPEZKOE_1: TRadioButton;
    rbTYPEZKOE_2: TRadioButton;
    gbTYPECABLE: TGroupBox;
    rbTYPECABLE_0: TRadioButton;
    rbTYPECABLE_1: TRadioButton;
    lblCODEPROJECTCOMPOSITE: TLabel;
    edtCODEPROJECTCOMPOSITE: TEdit;
    lblNameProject: TLabel;
    memNameProjectByShifr: TMemo;
    HTTPRIOTKClassificationType: THTTPRIO;
    lbl1: TLabel;
    edtCountWork: TEdit;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    procedure rbVOLTAGE220Click(Sender: TObject);
    procedure makeCodeProjectCompositeAndFindCalcul();
    procedure rbVOLTAGE380Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbNOMINALVALUEChange(Sender: TObject);
    procedure rbwithoutUSEPILLARClick(Sender: TObject);
    procedure rbwithUSEPILLARClick(Sender: TObject);
    procedure rbTYPEZKOE_0Click(Sender: TObject);
    procedure rbTYPEZKOE_1Click(Sender: TObject);
    procedure rbTYPEZKOE_2Click(Sender: TObject);
    procedure rbTYPECABLE_0Click(Sender: TObject);
    procedure rbTYPECABLE_1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  planCode : Integer;
  yeargen : Integer;
  end;

var
  frmAddWorkItemByShifr: TfrmAddWorkItemByShifr;
  TKClType2CodeProjectObj : TKClType2CodeProject;
  TKClassificationTypeCode : Integer;

implementation

uses TKClassificationTypeController, ENPlanWorkItemController ,XSBuiltIns;



{$R *.dfm}

procedure TfrmAddWorkItemByShifr.rbTYPECABLE_0Click(Sender: TObject);
begin
    TKClType2CodeProjectObj.typeCable:= TKCLTYPE2CODEPROJECT_TYPECABLE_0;
   makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.rbTYPECABLE_1Click(Sender: TObject);
begin
   TKClType2CodeProjectObj.typeCable:= TKCLTYPE2CODEPROJECT_TYPECABLE_1;
   makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.rbTYPEZKOE_0Click(Sender: TObject);
begin
  TKClType2CodeProjectObj.typeZKOE := TKCLTYPE2CODEPROJECT_TYPEZKOE_0;

   makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.rbTYPEZKOE_1Click(Sender: TObject);
begin
   TKClType2CodeProjectObj.typeZKOE := TKCLTYPE2CODEPROJECT_TYPEZKOE_1;
   makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.rbTYPEZKOE_2Click(Sender: TObject);
begin
    TKClType2CodeProjectObj.typeZKOE := TKCLTYPE2CODEPROJECT_TYPEZKOE_2;

   makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.rbVOLTAGE220Click(Sender: TObject);
begin
          cbbNOMINALVALUE.Clear;
          cbbNOMINALVALUE.items.add('6');
          cbbNOMINALVALUE.items.add('10');
          cbbNOMINALVALUE.items.add('16');
          cbbNOMINALVALUE.items.add('20');
          cbbNOMINALVALUE.items.add('25');
          cbbNOMINALVALUE.items.add('32');
          cbbNOMINALVALUE.items.add('40');
          cbbNOMINALVALUE.items.add('50');
          cbbNOMINALVALUE.items.add('63');

          TKClType2CodeProjectObj.voltage:= TKCLTYPE2CODEPROJECT_VOLTAGE_220;

          makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.rbVOLTAGE380Click(Sender: TObject);
begin
          cbbNOMINALVALUE.Clear;
          cbbNOMINALVALUE.items.add('6');
          cbbNOMINALVALUE.items.add('10');
          cbbNOMINALVALUE.items.add('16');
          cbbNOMINALVALUE.items.add('20');
          cbbNOMINALVALUE.items.add('25');
          cbbNOMINALVALUE.items.add('32');
          cbbNOMINALVALUE.items.add('40');
          cbbNOMINALVALUE.items.add('50');
          cbbNOMINALVALUE.items.add('63');

          TKClType2CodeProjectObj.voltage:= TKCLTYPE2CODEPROJECT_VOLTAGE_380;

          makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.rbwithoutUSEPILLARClick(Sender: TObject);
begin
   TKClType2CodeProjectObj.usePillar :=  TKCLTYPE2CODEPROJECT_WITHOUT_USEPILLAR;

   makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.rbwithUSEPILLARClick(Sender: TObject);
begin
   TKClType2CodeProjectObj.usePillar :=  TKCLTYPE2CODEPROJECT_WITH_USEPILLAR;

   makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.cbbNOMINALVALUEChange(Sender: TObject);
begin
    TKClType2CodeProjectObj.nominalValue := StrToInt(cbbNOMINALVALUE.Text);

    makeCodeProjectCompositeAndFindCalcul();
end;

procedure TfrmAddWorkItemByShifr.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    countGen : TXSDecimal;
begin

    if ModalResult = mrOk then
  begin

  if TKClassificationTypeCode = LOW_INT then
  begin
      Application.MessageBox(PChar('Типовий проект(калькуляція) не визначена !!!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else
  begin

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    countGen:= TXSDecimal.Create;
    countGen.DecimalString := edtCountWork.Text;

    if tkClassificationTypeCode = LOW_INT then
    begin
      Application.MessageBox(PChar('Невідомий  код Класифікації !'),PChar('Помилка !'),MB_ICONERROR);
      Exit;
    end;

    if planCode = LOW_INT then
    begin
      Application.MessageBox(PChar('Невідомий  код Плана !'),PChar('Помилка !'),MB_ICONERROR);
      Exit;
    end;

    TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForTechConditions( tkClassificationTypeCode , countGen,planCode );

  end;
end;

end;

procedure TfrmAddWorkItemByShifr.FormShow(Sender: TObject);
begin
     if TKClType2CodeProjectObj = nil then
        TKClType2CodeProjectObj:= TKClType2CodeProject.Create;

     DisableControls([edtCODEPROJECTCOMPOSITE , memNameProjectByShifr]);
     edtCountWork.Text:= '1';
     TKClassificationTypeCode:= LOW_INT;
end;

procedure TfrmAddWorkItemByShifr.makeCodeProjectCompositeAndFindCalcul();
 var
 voltage_txt : string;
 nominalvalue_txt : string;
 usepillar_txt: string;
 typezkoe_txt :string;
 typecable_txt :string;

 TempTKClassificationType: TKClassificationTypeControllerSoapPort;
 filKClassificationType : TKClassificationTypeFilter;
 TKClassificationTypeList: TKClassificationTypeShortList;
 begin
   if rbVOLTAGE220.Checked then
   voltage_txt := IntToStr(TKCLTYPE2CODEPROJECT_VOLTAGE_220)
   else if rbVOLTAGE380.Checked then
   voltage_txt := IntToStr(TKCLTYPE2CODEPROJECT_VOLTAGE_380)
   else
   voltage_txt := '_';


   if cbbNOMINALVALUE.Text <> '' then
   nominalvalue_txt := cbbNOMINALVALUE.Text
   else
   nominalvalue_txt := '__';

   if rbwithoutUSEPILLAR.Checked  then
      usepillar_txt := IntToStr(TKCLTYPE2CODEPROJECT_WITHOUT_USEPILLAR)
   else if rbwithUSEPILLAR.Checked  then
      usepillar_txt := IntToStr(TKCLTYPE2CODEPROJECT_WITH_USEPILLAR)
   else
      usepillar_txt := '_';

   if rbTYPEZKOE_0.Checked then
      typezkoe_txt := IntToStr(TKCLTYPE2CODEPROJECT_TYPEZKOE_0)
   else if rbTYPEZKOE_1.Checked then
      typezkoe_txt := IntToStr(TKCLTYPE2CODEPROJECT_TYPEZKOE_1)
   else if rbTYPEZKOE_2.Checked then
      typezkoe_txt := IntToStr(TKCLTYPE2CODEPROJECT_TYPEZKOE_2)
   else  typezkoe_txt:='_';

   if rbTYPECABLE_0.Checked then
      typecable_txt:= IntToStr(TKCLTYPE2CODEPROJECT_TYPECABLE_0)
   else if rbTYPECABLE_1.Checked then
      typecable_txt:= IntToStr(TKCLTYPE2CODEPROJECT_TYPECABLE_1)
   else typecable_txt:='_';

    if length(nominalvalue_txt) = 1  then
    nominalvalue_txt := '0'+nominalvalue_txt;

    edtCODEPROJECTCOMPOSITE.Text :=   voltage_txt+nominalvalue_txt+'-'
               +usepillar_txt+ typezkoe_txt+typecable_txt + '/' + IntToStr(yeargen)+'-ЕП';

       if AnsiPos('_',edtCODEPROJECTCOMPOSITE.Text) = 0 then

     begin
       TempTKClassificationType :=  HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;

       filKClassificationType := TKClassificationTypeFilter.Create;
       SetNullIntProps(filKClassificationType);
       SetNullXSProps(filKClassificationType);

       filKClassificationType.conditionSQL :=
       ' tk.CODE in ( select qq.classificationtyperfcd from TKCLTYPE2CODEPROJECT qq , tkclassificationtype ww ' +
       '       where qq.classificationtyperfcd = ww.code ' +
       '       and qq.voltage = ' + IntToStr(TKClType2CodeProjectObj.voltage) +
       '       and qq.nominalvalue = ' + IntToStr(TKClType2CodeProjectObj.nominalValue) +
       '       and qq.usepillar = ' + IntToStr(TKClType2CodeProjectObj.usePillar) +
       '       and qq.typezkoe = ' + IntToStr(TKClType2CodeProjectObj.typeZKOE) +
       '       and qq.typecable = ' + IntToStr(TKClType2CodeProjectObj.typeCable) + ')';

       TKClassificationTypeList := TempTKClassificationType.getScrollableFilteredList(filKClassificationType,0,-1);

       if High(TKClassificationTypeList.list) > -1 then
          begin
           MakeMultiline(memNameProjectByShifr.Lines, TKClassificationTypeList.list[0].kod + ' ' + TKClassificationTypeList.list[0].name  );
           TKClassificationTypeCode := TKClassificationTypeList.list[0].code;
          end
       else
          begin
            MakeMultiline(memNameProjectByShifr.Lines,'Типовий проект(калькуляцію) не знайдено');
            TKClassificationTypeCode := LOW_INT;
          end;

     end
     else
        begin
            MakeMultiline(memNameProjectByShifr.Lines,'Типовий проект(калькуляцію) не знайдено');
            TKClassificationTypeCode := LOW_INT;
          end;




 end;

end.
