
unit EditENAct2DFDocDecree;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2DFDocDecreeController,
  ENWarrantController, ShowENWarrant, ENWarrantTypeController, ENConsts,
  DMReportsUnit, ENPlanWorkController, AdvObj, ENSettingForDFDecreeController,
  ENDepartmentController ;

type
  TfrmENAct2DFDocDecreeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblSpecifications : TLabel;
    edtSpecifications: TMemo;
    lblNumberHours : TLabel;


  HTTPRIOENAct2DFDocDecree: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtNumberHours: TComboBox;
    GroupBox1: TGroupBox;
    edtResponsSurnameGenitive: TEdit;
    edtDepartmentNameGenitive: TEdit;
    lblDepartmentNameGenitive: TLabel;
    edtDepartmentName: TEdit;
    lblDepartmentName: TLabel;
    edtResponsPatronimicGenitive: TEdit;
    lblResponsPatronimicGenitive: TLabel;
    edtResponsPatronimic: TEdit;
    lblResponsPatronimic: TLabel;
    edtResponsNameGenitive: TEdit;
    lblResponsNameGenitive: TLabel;
    edtResponsName: TEdit;
    lblResponsName: TLabel;
    lblResponsSurnameGenitive: TLabel;
    edtResponsSurname: TEdit;
    lblResponsSurname: TLabel;
    spbWarrantNumber: TSpeedButton;
    edtresponsPosition: TEdit;
    lblresponsPosition: TLabel;
    lblresponsGenitivePosition: TLabel;
    edtresponsGenitivePosition: TEdit;
    GroupBox2: TGroupBox;
    PopupMenu1: TPopupMenu;
    pmViewSettingDecree: TMenuItem;
    pmUpdateSettingDecreeByCode: TMenuItem;
    pmFilterSettingDecree: TMenuItem;
    ActionList1: TActionList;
    actViewSettingDecree: TAction;
    actUpdateSettingDecreeByCode: TAction;
    actFilterSettingDecree: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    sgENSettingForDFDecree: TAdvStringGrid;
    ImageList1: TImageList;
    HTTPRIOENSettingForDFDecree: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbWarrantNumberClick(Sender: TObject);
  procedure actFilterSettingDecreeExecute(Sender: TObject);
  procedure actUpdateSettingDecreeByCodeExecute(settingForDecreeCode:Integer);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    forAddDefaultSetting : Boolean;
    depCode:Integer;

end;

var
  frmENAct2DFDocDecreeEdit: TfrmENAct2DFDocDecreeEdit;
  ENAct2DFDocDecreeObj: ENAct2DFDocDecree;

implementation

uses ShowENSettingForDFDecree;


{uses  
    EnergyproController, EnergyproController2, ENAct2DFDocDecreeController  ;
}
{$R *.dfm}

var
ENSettingForDFDecreeHeaders: array [1..17] of String =
        ( 'Код'
          ,'Підрозділ шаблону '//,'Типы документов dfDoc'
          ,'Типы документов dfDoc Название'
          ,'Каталог наказів і розпоряджень(Класифікація за каталогом)'
          ,'Каталог наказів і розпоряджень(Класифікація за каталогом) название'
          ,'Префікс для документів код'
          ,'Префікс для документів Назва'
          ,'Табельний номер особи, яка підписує документ'
          ,'П.І.Б. особи, яка підписує документ'
          ,'Посада особи, яка підписує документ'
          ,'Табельний номер особи, яка ініціює документ'
          ,'П.І.Б. особи, яка ініціює документ'
          ,'Служба особи, яка ініціює документ'
          ,'Код служби особи, яка ініціює документ'
          ,'Табельний номер уповноваженої особи'
          ,'П.І.Б. уповноваженої особи'
          ,'Посада уповноваженої особи'
        );



procedure TfrmENAct2DFDocDecreeEdit.FormShow(Sender: TObject);

begin


  DisableControls([edtCode]);


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     // edtUserAdd
     // ,edtDateAdd
     // ,edtUserGen
     // ,edtDateEdit
     // ,
      edtSpecifications
      ,edtNumberHours
      //,edtDFDocDecreeCode
      //,edtDfDocCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENAct2DFDocDecreeObj.code);
      MakeMultiline(edtCommentGen.Lines, ENAct2DFDocDecreeObj.commentGen);
   // edtUserAdd.Text := ENAct2DFDocDecreeObj.userAdd;
   //   SetDateFieldForDateTimePicker(edtDateAdd, ENAct2DFDocDecreeObj.dateAdd);
   // edtUserGen.Text := ENAct2DFDocDecreeObj.userGen;
    //  SetDateFieldForDateTimePicker(edtDateEdit, ENAct2DFDocDecreeObj.dateEdit);
    MakeMultiline(edtSpecifications.Lines, ENAct2DFDocDecreeObj.specifications);
    if ( ENAct2DFDocDecreeObj.numberHours <> Low(Integer) ) then
       edtNumberHours.Text := IntToStr(ENAct2DFDocDecreeObj.numberHours)
    else
       edtNumberHours.Text := '';
//    if ( ENAct2DFDocDecreeObj.DFDocDecreeCode <> Low(Integer) ) then
//       edtDFDocDecreeCode.Text := IntToStr(ENAct2DFDocDecreeObj.DFDocDecreeCode)
//    else
//       edtDFDocDecreeCode.Text := '';
//    if ( ENAct2DFDocDecreeObj.dfDocCode <> Low(Integer) ) then
//       edtDfDocCode.Text := IntToStr(ENAct2DFDocDecreeObj.dfDocCode)
//    else
//       edtDfDocCode.Text := '';

    edtResponsSurname.Text := ENAct2DFDocDecreeObj.responsSurname;
    edtResponsSurnameGenitive.Text := ENAct2DFDocDecreeObj.responsSurnameGenitive;
    edtResponsName.Text := ENAct2DFDocDecreeObj.responsName;
    edtResponsNameGenitive.Text := ENAct2DFDocDecreeObj.responsNameGenitive;
    edtResponsPatronimic.Text := ENAct2DFDocDecreeObj.responsPatronimic;
    edtResponsPatronimicGenitive.Text := ENAct2DFDocDecreeObj.responsPatronimicGenitive;
    edtDepartmentName.Text := ENAct2DFDocDecreeObj.departmentName;
    edtDepartmentNameGenitive.Text := ENAct2DFDocDecreeObj.departmentNameGenitive;
    edtresponsPosition.text := ENAct2DFDocDecreeObj.responsPosition;
    edtresponsGenitivePosition.text := ENAct2DFDocDecreeObj.responsGenitivePosition;


  end;

//  if ((forAddDefaultSetting) and (DialogState = dsInsert) )then
//  begin
//    // HideControls([lblCommentGen,edtCommentGen]);
//   end;

end;



procedure TfrmENAct2DFDocDecreeEdit.spbWarrantNumberClick(Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
    depCode : Integer;
    PlanWorkList: ENPlanWorkShortList;
begin

     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);


     f.warrantTypeRef := ENWarrantTypeRef.Create;
     f.warrantTypeRef.code := ENConsts.ENWARRANT_TYPE_DECREE_RESPONS;

     PlanWorkList := DMReports.getPlansListByActCode(ENAct2DFDocDecreeObj.actRef.code,' enplanwork.datestart desc ');

     if High(PlanWorkList.list) <= -1 then
       begin
        raise Exception.Create('Помилка при визначенні шаблона з реквізитами для розпоряджень !');
       end;
     depCode := PlanWorkList.list[0].departmentRefCode;

      // Не знайдено шаблон для реквізитів по розпорядженням

       f.conditionSQL :=
       ' endepartment.code in (select array2items(string_to_array(getdepartmentcodesdown( '
        + IntToStr(depCode) +' ),' + chr(39) + ',' + Chr(39)+ '))::double precision)';

     if Length(f.conditionSQL) = 0 then
     f.conditionSQL := '  warrantstatusrefcode = 0'
     else
     f.conditionSQL := f.conditionSQL + ' and warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     frmENWarrantShow.Caption:='Відповідальна особа';
     DisableActions([frmENWarrantShow.actNoFilter , frmENWarrantShow.actDelete]);
     frmENWarrantShow.enwarrantTypeCode :=  ENConsts.ENWARRANT_TYPE_DECREE_RESPONS;




     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try


                 warrant := DMReports.getWarrantByCode(StrToInt(GetReturnValue(sgENWarrant,0)));

                 edtResponsSurname.Text:= warrant.personSurname;
                 edtResponsSurnameGenitive.Text:= warrant.personSurnameGenitive;
                 edtResponsName.Text:= warrant.personName;
                 edtResponsNameGenitive.Text:= warrant.personNameGenitive;
                 edtResponsPatronimic.Text:= warrant.personPatronimic;
                 edtResponsPatronimicGenitive.Text:= warrant.personPatronimicGenitive;
                 edtDepartmentName.Text:= warrant.departmentName;
                 edtDepartmentNameGenitive.Text := warrant.departmentNameGenitive;
                 edtresponsPosition.Text:=  warrant.warrantPosition;
                 edtresponsGenitivePosition.Text:=  warrant.genitivePosition;

              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;



end;

procedure TfrmENAct2DFDocDecreeEdit.actFilterSettingDecreeExecute(
  Sender: TObject);
var
  settingForDecree : ENSettingForDFDecreeFilter;
  fplan : ENPlanWorkFilter;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  pCodesArr: ENPlanWorkController.ArrayOfInteger;
  planworkObj : ENPlanWork;
  depCode : Integer;
  SettingDecreeByCode : Integer;
begin


  settingForDecree:= ENSettingForDFDecreeFilter.Create();
  SetNullXSProps(settingForDecree);
  SetNullIntProps(settingForDecree);

   fplan := ENPlanWorkFilter.Create;
   SetNullIntProps(fplan);
   SetNullXSProps(fplan);
   fplan.conditionSQL := 'enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr( ENAct2DFDocDecreeObj.actRef.code ) + ')';

   TempENPlanWork :=  HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

   pCodesArr:= TempENPlanWork.getFilteredCodeArray(fplan);

   if High(pCodesArr) <= -1 then
       begin
        raise Exception.Create('Помилка при визначенні шаблона з реквізитами для розпоряджень !');
       end;
    planworkObj := DMReports.getPlanByCode(pCodesArr[0]);
    depCode := planworkObj.departmentRef.code;

    settingForDecree.departmentRef := ENDepartmentRef.Create();
    settingForDecree.departmentRef.code := depCode;

    frmENSettingForDFDecreeShow := TfrmENSettingForDFDecreeShow.Create(Application,fmNormal, settingForDecree);
    DisableActions([frmENSettingForDFDecreeShow.actNoFilter]);


    if frmENSettingForDFDecreeShow.ShowModal = mrOk then
    begin
      try
         SettingDecreeByCode:= StrToInt(frmENSettingForDFDecreeShow.sgENSettingForDFDecree.Cells[0,frmENSettingForDFDecreeShow.sgENSettingForDFDecree.row]);
       except
       on EConvertError do Exit;
      end;

       actUpdateSettingDecreeByCodeExecute(SettingDecreeByCode);
    end;



end;

procedure TfrmENAct2DFDocDecreeEdit.actUpdateSettingDecreeByCodeExecute(settingForDecreeCode:Integer);
var
  TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
  i , selectedRow,ColCount: Integer;
  LastCount , LastRow : Integer;
  ENSettingForDFDecreeList: ENSettingForDFDecreeShortList;
  FilterENSettingForDFDecree : ENSettingForDFDecreeFilter;
begin
  SetGridHeaders(ENSettingForDFDecreeHeaders, sgENSettingForDFDecree.ColumnHeaders);
  TempENSettingForDFDecree :=  HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;
  LastCount:= 1;
//  if FilterENSettingForDFDecree = nil then
//  begin
     FilterENSettingForDFDecree := ENSettingForDFDecreeFilter.Create;
     SetNullIntProps(FilterENSettingForDFDecree);
     SetNullXSProps(FilterENSettingForDFDecree);
//  end;

   FilterENSettingForDFDecree.departmentRef:= ENDepartmentRef.Create;
   FilterENSettingForDFDecree.departmentRef.code := depCode;


  ENSettingForDFDecreeList := TempENSettingForDFDecree.getScrollableFilteredList(FilterENSettingForDFDecree,0,10000);
  LastCount:=High(ENSettingForDFDecreeList.list);

  if LastCount > -1 then
     sgENSettingForDFDecree.RowCount:=LastCount+2
  else
     sgENSettingForDFDecree.RowCount:=2;

   with sgENSettingForDFDecree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSettingForDFDecreeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSettingForDFDecreeList.list[i].departmentRefShortName;
//        if ENSettingForDFDecreeList.list[i].dfDocTypeCode = Low(Integer) then
//          Cells[1,i+1] := ''
//        else
//          Cells[1,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].dfDocTypeCode);
        Cells[2,i+1] := ENSettingForDFDecreeList.list[i].dfDocTypeName;
        if ENSettingForDFDecreeList.list[i].catalogCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].catalogCode);
        Cells[4,i+1] := ENSettingForDFDecreeList.list[i].catalogName;
        if ENSettingForDFDecreeList.list[i].dfDocPrefixCode = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].dfDocPrefixCode);
        Cells[6,i+1] := ENSettingForDFDecreeList.list[i].dfDocPrefixName;
        Cells[7,i+1] := ENSettingForDFDecreeList.list[i].prefixSignerTabN;
        Cells[8,i+1] := ENSettingForDFDecreeList.list[i].prefixSignerFio;
        Cells[9,i+1] := ENSettingForDFDecreeList.list[i].prefixSignerPostInfo;
        Cells[10,i+1] := ENSettingForDFDecreeList.list[i].initiatorTabn;
        Cells[11,i+1] := ENSettingForDFDecreeList.list[i].initiatorFio;
        Cells[12,i+1] := ENSettingForDFDecreeList.list[i].initiatorPodrName;
        if ENSettingForDFDecreeList.list[i].initiatorPodrCode = Low(Integer) then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].initiatorPodrCode);
        Cells[14,i+1] := ENSettingForDFDecreeList.list[i].designatedTabn;
        Cells[15,i+1] := ENSettingForDFDecreeList.list[i].designatedFio;
        Cells[16,i+1] := ENSettingForDFDecreeList.list[i].designatedpostInfo;
        LastRow:=i+1;
        sgENSettingForDFDecree.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENSettingForDFDecree.Row:=1;

    if selectedRow <> 0 then
    begin
    if sgENSettingForDFDecree.RowCount > selectedRow then
      sgENSettingForDFDecree.Row := selectedRow
    else
      sgENSettingForDFDecree.Row := sgENSettingForDFDecree.RowCount - 1;
    end
    else
      sgENSettingForDFDecree.Row:=1;

end;

procedure TfrmENAct2DFDocDecreeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
begin
  if  (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
//      edtUserAdd
//      ,edtUserGen
//      ,
       edtSpecifications
      ,edtNumberHours
//      ,edtDFDocDecreeCode
//      ,edtDfDocCode
     ]) and (forAddDefaultSetting=false )   then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else if (forAddDefaultSetting= true ) then
  if not NoBlankValues([
      edtSpecifications
      ,edtNumberHours
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENAct2DFDocDecree := HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;


     ENAct2DFDocDecreeObj.commentGen := edtCommentGen.Text; 

    // ENAct2DFDocDecreeObj.userAdd := edtUserAdd.Text;

   //  ENAct2DFDocDecreeObj.dateAdd := GetTXSDateTimeFromTDateTimePicker(edtdateAdd);

   //  ENAct2DFDocDecreeObj.userGen := edtUserGen.Text;

     //ENAct2DFDocDecreeObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);

     ENAct2DFDocDecreeObj.specifications := edtSpecifications.Text; 

     if ( edtNumberHours.Text <> '' ) then
       ENAct2DFDocDecreeObj.numberHours := StrToInt(edtNumberHours.Text)
     else
       ENAct2DFDocDecreeObj.numberHours := Low(Integer) ;

//     if ( edtDFDocDecreeCode.Text <> '' ) then
//       ENAct2DFDocDecreeObj.DFDocDecreeCode := StrToInt(edtDFDocDecreeCode.Text)
//     else
//       ENAct2DFDocDecreeObj.DFDocDecreeCode := Low(Integer) ;
//
//     if ( edtDfDocCode.Text <> '' ) then
//       ENAct2DFDocDecreeObj.dfDocCode := StrToInt(edtDfDocCode.Text)
//     else
//       ENAct2DFDocDecreeObj.dfDocCode := Low(Integer) ;

     ENAct2DFDocDecreeObj.responsSurname := edtResponsSurname.Text;

     ENAct2DFDocDecreeObj.responsSurnameGenitive := edtResponsSurnameGenitive.Text;

     ENAct2DFDocDecreeObj.responsName := edtResponsName.Text;

     ENAct2DFDocDecreeObj.responsNameGenitive := edtResponsNameGenitive.Text;

     ENAct2DFDocDecreeObj.responsPatronimic := edtResponsPatronimic.Text;

     ENAct2DFDocDecreeObj.responsPatronimicGenitive := edtResponsPatronimicGenitive.Text;

     ENAct2DFDocDecreeObj.departmentName := edtDepartmentName.Text;

     ENAct2DFDocDecreeObj.departmentNameGenitive := edtDepartmentNameGenitive.Text;

     ENAct2DFDocDecreeObj.responsPosition:= edtresponsPosition.text;

     ENAct2DFDocDecreeObj.responsGenitivePosition:= edtresponsGenitivePosition.text;


    if (( DialogState = dsInsert ) and (forAddDefaultSetting = False)) then
    begin
      ENAct2DFDocDecreeObj.code:=low(Integer);
      TempENAct2DFDocDecree.add(ENAct2DFDocDecreeObj);
    end
    else
    if ((DialogState = dsEdit) and (forAddDefaultSetting = False))  then
    begin
      TempENAct2DFDocDecree.save(ENAct2DFDocDecreeObj);
    end;
  end;
end;


end.